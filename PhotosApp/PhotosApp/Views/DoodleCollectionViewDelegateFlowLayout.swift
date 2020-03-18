//
//  DoodleCollectionViewDelegateFlowLayout.swift
//  PhotosApp
//
//  Created by Keunna Lee on 2020/03/18.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class DoodleCollectionViewDelegateFlowLayout: NSObject, UICollectionViewDelegateFlowLayout {
    
    let cellSize = CGSize(width: 110, height: 50)
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
}
