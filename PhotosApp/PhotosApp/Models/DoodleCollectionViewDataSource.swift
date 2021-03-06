//
//  DoodleViewControllerDataSource.swift
//  PhotosApp
//
//  Created by Keunna Lee on 2020/03/18.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit
import Photos

class DoodleCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private let doodleDataManager = DoodleDataManager()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = doodleDataManager.doodleImagesCount() else { return 0 }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoodleImageCell.identifier, for: indexPath) as! DoodleImageCell
        doodleDataManager.fetchImage(for: indexPath.item) { (doodleImage, error) in
            cell.doodleImage = error == nil ? doodleImage : nil
            cell.stopActivityIndicatorView()
        }
        return cell
    }
}
