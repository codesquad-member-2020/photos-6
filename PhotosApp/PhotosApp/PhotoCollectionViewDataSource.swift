//
//  PhotoCollectionViewDataSource.swift
//  PhotosApp
//
//  Created by Keunna Lee on 2020/03/16.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class PhotoCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    let TOTAL_CELL_COUNT = 40
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TOTAL_CELL_COUNT
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.CELL_IDENTIFIER, for: indexPath)
        cell.backgroundColor = UIColor(red: randomRGBValue(), green: randomRGBValue(), blue: randomRGBValue(), alpha: 1)
        return cell
    }
    
    private func randomRGBValue() -> CGFloat {
        return CGFloat.random(in: 0 ... 1)
    }
}
