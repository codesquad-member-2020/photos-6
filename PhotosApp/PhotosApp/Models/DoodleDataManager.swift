//
//  DoodleDataManager.swift
//  PhotosApp
//
//  Created by Cory Kim on 2020/03/18.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class DoodleDataManager {
    
    let doodleURL = "https://public.codesquad.kr/jk/doodle.json"
    private var doodleImages: [DoodleImage]?
    
    init() {
        decodeJSON()
    }
    
    func downloadImages(completion: @escaping (UIImage) -> ()) {
        doodleImages?.forEach { doodleImage in
            DispatchQueue.global().async {
                self.requestImage(doodleImage: doodleImage, completion: completion)
            }
        }
    }
    
    private func requestImage(doodleImage: DoodleImage, completion: @escaping (UIImage) -> ()) {
        URLSession.shared.dataTask(with: doodleImage.imageURL) { (data, _, err) in
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            completion(image)
        }
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
            } catch {
                self.doodleImages = nil
            }
        }
    }
}
