//
//  DoodleImage.swift
//  PhotosApp
//
//  Created by Cory Kim on 2020/03/18.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

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
