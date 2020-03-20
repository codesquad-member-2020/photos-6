//
//  PhotoCollectionViewDelegateFlowLayout.swift
//  PhotosApp
//
//  Created by Keunna Lee on 2020/03/17.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class PhotoCollectionViewDelegateFlowLayout: NSObject, UICollectionViewDelegateFlowLayout {
    
    private let numberOfItemsInRow: CGFloat = 3
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - ViewController.minimumItemSpacing * 2) / numberOfItemsInRow
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PhotoCell
        cell.selectedBackgroundView = {
            let backgroundView = UIView()
            backgroundView.layer.borderColor = #colorLiteral(red: 0.2784313725, green: 0.7176470588, blue: 0.5294117647, alpha: 1)
            backgroundView.layer.borderWidth = 4
            backgroundView.backgroundColor = .clear
            return backgroundView
        }()
        cell.bringSubviewToFront(cell.selectedBackgroundView!)
    }
}
