//
//  DoodleDataManager.swift
//  PhotosApp
//
//  Created by Cory Kim on 2020/03/18.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class DoodleDataManager {
    let urlString = "https://public.codesquad.kr/jk/doodle.json"
    private var doodleImages: [DoodleImage] = []
    
    init() {
        decodeJSON()
    }
    
    private func decodeJSON() {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            if let err = err {
                print(err)
            }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(.doodleDateFormatter)
            do {
                self.doodleImages = try decoder.decode([DoodleImage].self, from: data)
                print(self.doodleImages)
            } catch {
                print(error)
            }
        }
    }
}

extension DateFormatter {
    static let doodleDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter
    }()
}

struct DoodleImage: Codable {
    let title: String
    let imageUrl: URL
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case title
        case imageUrl = "image"
        case date
    }
}
