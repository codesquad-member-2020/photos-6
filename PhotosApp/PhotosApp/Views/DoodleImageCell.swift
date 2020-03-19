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
    let activityIndicatorView = UIActivityIndicatorView(style: .medium)
    let doodleImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    var doodleImage : UIImage! {
        didSet {
            DispatchQueue.main.async {
                self.doodleImageView.image = self.doodleImage
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        setupUI()
        activityIndicatorView.startAnimating()
    }
    
    private func setupUI() {
        addSubview(activityIndicatorView)
        addSubview(doodleImageView)
        activityIndicatorView.color = .white
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        activityIndicatorView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        activityIndicatorView.widthAnchor.constraint(equalTo: activityIndicatorView.heightAnchor).isActive = true
        doodleImageView.translatesAutoresizingMaskIntoConstraints = false
        doodleImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        doodleImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        doodleImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        doodleImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func stopActivityIndicatorView() {
        DispatchQueue.main.async {
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    override func prepareForReuse() {
        activityIndicatorView.startAnimating()
    }
}

