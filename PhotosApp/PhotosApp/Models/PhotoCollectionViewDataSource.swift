//
//  PhotoCollectionViewDataSource.swift
//  PhotosApp
//
//  Created by Keunna Lee on 2020/03/16.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit
import Photos

class PhotoCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    static let PhotoLibraryChangedNotification = NSNotification.Name(rawValue: "PhotoLibraryChangedNotification")
    private(set) var fetchResult: PHFetchResult<PHAsset>!
    private let fetchOptions: PHFetchOptions = {
        let fetchOptions = PHFetchOptions()
        fetchOptions.includeAssetSourceTypes = .typeUserLibrary
        fetchOptions.includeAllBurstAssets = false
        fetchOptions.includeHiddenAssets = false
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        fetchOptions.fetchLimit = 40
        return fetchOptions
    }()
    private let imageManager = PHCachingImageManager()
    private let targetSize: CGSize = CGSize(width: 100, height: 100)
    
    override init() {
        self.fetchResult = PHAsset.fetchAssets(with: fetchOptions)
        super.init()
        PHPhotoLibrary.shared().register(self)
    }
    
    deinit {
        PHPhotoLibrary.shared().unregisterChangeObserver(self)
    }
    
    func updateFetchResult(_ fetchResult: PHFetchResult<PHAsset>) {
        self.fetchResult = fetchResult
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as! PhotoCell
        let asset = fetchResult.object(at: indexPath.item)
        imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFill, options: nil) { (image, _) in
            cell.thumbnailImage = image
        }
        return cell
    }
}

extension PhotoCollectionViewDataSource: PHPhotoLibraryChangeObserver{
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let changes = changeInstance.changeDetails(for: fetchResult) else { return }
        let fetchResult = changes.fetchResultAfterChanges
        updateFetchResult(fetchResult)
        guard changes.hasIncrementalChanges else { return }
        guard let inserted = changes.insertedIndexes, inserted.count > 0 else { return }
        NotificationCenter.default.post(name: PhotoCollectionViewDataSource.PhotoLibraryChangedNotification,
                                        object: nil,
                                        userInfo: ["inserted": inserted])
    }
}
