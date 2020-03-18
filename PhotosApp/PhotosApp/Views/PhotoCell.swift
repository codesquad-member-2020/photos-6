//
//  PhotoCell.swift
//  PhotosApp
//
//  Created by Keunna Lee on 2020/03/16.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    static let identifier = "photoCell"
    var thumbnailImage : UIImage! {
        didSet {
            thumbnailImageView.image = thumbnailImage
        }
    }
}
