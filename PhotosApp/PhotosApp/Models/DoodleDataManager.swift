//
//  DoodleDataManager.swift
//  PhotosApp
//
//  Created by Cory Kim on 2020/03/18.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class DoodleDataManager {
    let doodleURL = "https://public.codesquad.kr/jk/doodle.json"
    private var doodleImages: [DoodleImage] = []
    
    init() {
        decodeJSON()
    }
    
    private func decodeJSON() {
        guard let url = URL(string: doodleURL) else { return }
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
