//
//  PhotoCollectionViewDelegateFlowLayout.swift
//  PhotosApp
//
//  Created by Keunna Lee on 2020/03/17.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class PhotoCollectionViewDelegateFlowLayout: NSObject, UICollectionViewDelegateFlowLayout {
    let cellSize = CGSize(width: 100, height: 100)
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
}
