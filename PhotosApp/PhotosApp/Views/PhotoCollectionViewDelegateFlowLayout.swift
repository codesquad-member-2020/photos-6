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
    static let minimnumNumberForVideo: Int = 3
    static let SelectedItemsCountHasChanged = NSNotification.Name(rawValue: "SelectedItemsCountHasChanged")
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - ViewController.minimumItemSpacing * 2) / numberOfItemsInRow
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PhotoCell
        cell.selectedBackgroundView = PhotoCellSelectedBackgroundVIew(frame: cell.frame)
        cell.bringSubviewToFront(cell.selectedBackgroundView!)
        postNotification(count: collectionView.indexPathsForSelectedItems?.count, indexPath: indexPath, isDeselected: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        postNotification(count: collectionView.indexPathsForSelectedItems?.count, indexPath: indexPath, isDeselected: true)
    }
    
    private func postNotification(count: Int?, indexPath: IndexPath, isDeselected: Bool) {
        NotificationCenter.default.post(name: Self.SelectedItemsCountHasChanged,
        object: nil,
        userInfo: ["count": count ?? 0, "index": indexPath.item, "isDeselected": isDeselected])
    }
}
