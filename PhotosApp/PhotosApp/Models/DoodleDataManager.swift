//
//  DoodleDataManager.swift
//  PhotosApp
//
//  Created by Cory Kim on 2020/03/18.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class DoodleDataManager {
    
    static let DoodleImagesHaveDecodedNotification = NSNotification.Name(rawValue: "DoodleImagesHaveDecodedNotification")
    let doodleURL = "https://public.codesquad.kr/jk/doodle.json"
    private(set) var doodleImages: [DoodleImage]?
    
    init() {
        decodeJSON()
    }
    
    func doodleImagesCount() -> Int? {
        return doodleImages?.count
    }
    
    enum Result<Error> {
        case data
        case image
    }
    
    func fetchImage(for index: Int, completion: @escaping (UIImage?, Result<Error>?) -> ()) {
        guard let doodleImage = doodleImages?[index] else { return }
        URLSession.shared.dataTask(with: doodleImage.imageURL) { (data, _, err) in
            guard let data = data else {
                completion(nil, .data)
                return
            }
            guard let image = UIImage(data: data) else { completion(nil, .image); return }
            completion(image, nil)
        }.resume()
    }
    
    private func decodeJSON() {
        guard let url = URL(string: doodleURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            guard err == nil else { self.doodleImages = nil; return }
            guard let data = data else { self.doodleImages = nil; return }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(.doodleDateFormatter)
            do {
                self.doodleImages = try decoder.decode([DoodleImage].self, from: data)
                NotificationCenter.default.post(name: DoodleDataManager.DoodleImagesHaveDecodedNotification, object: nil)
            } catch {
                self.doodleImages = nil
            }
        }.resume()
    }
}
