//
//  PhotoCellSelectedBackgroundVIew.swift
//  PhotosApp
//
//  Created by Cory Kim on 2020/03/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class PhotoCellSelectedBackgroundVIew: UIView {
    
    private let keyColor: CGColor = #colorLiteral(red: 0.2784313725, green: 0.7176470588, blue: 0.5294117647, alpha: 1)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        layer.borderColor = keyColor
        layer.borderWidth = 4
        backgroundColor = .clear
    }
}
