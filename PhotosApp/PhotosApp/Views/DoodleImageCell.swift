//
//  DoodleImageCell.swift
//  PhotosApp
//
//  Created by Keunna Lee on 2020/03/18.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class DoodleImageCell: UICollectionViewCell {
    
    static let identifier = "doodleImageCell"
    let doodleImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    var doodleImage : UIImage! {
        didSet {
            doodleImageView.image = doodleImage
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        doodleImage = #imageLiteral(resourceName: "codesquad")
        addSubview(doodleImageView)
        doodleImageView.translatesAutoresizingMaskIntoConstraints = false
        doodleImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        doodleImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        doodleImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        doodleImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}

