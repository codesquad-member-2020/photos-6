//
//  PhotoCellSelectedBackgroundVIew.swift
//  PhotosApp
//
//  Created by Cory Kim on 2020/03/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class PhotoCellSelectedBackgroundVIew: UIView {

    private let keyColorName = "KeyColor"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        guard let keyColor = UIColor(named: keyColorName) else { return }
        layer.borderColor = keyColor.cgColor
        layer.borderWidth = 4
        backgroundColor = .clear
    }
}
