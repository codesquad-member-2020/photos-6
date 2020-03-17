//
//  ViewController.swift
//  PhotosApp
//
//  Created by Cory Kim on 2020/03/16.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    let delegateFlowLayout = PhotoCollectionViewDelegateFlowLayout()
    let dataSource = PhotoCollectionViewDataSource()
    let navigationBarTitle = "Photos"
    
    @IBAction func addImageButtonTapped(_ sender: UIBarButtonItem) {
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: #imageLiteral(resourceName: "codesquad"))
        }, completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupNavigationBarTitle()
        PHPhotoLibrary.shared().register(self)
    }
    
    deinit {
        PHPhotoLibrary.shared().unregisterChangeObserver(self)
    }
    
    private func setupNavigationBarTitle() {
        navigationItem.title = navigationBarTitle
    }
    
    private func setupCollectionView(){
        photoCollectionView.dataSource = dataSource
        photoCollectionView.delegate = delegateFlowLayout
    }
}

extension ViewController: PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        DispatchQueue.main.sync {
            guard let changes = changeInstance.changeDetails(for: dataSource.fetchResult) else { return }
            let fetchResult = changes.fetchResultAfterChanges
            dataSource.updateFetchResult(fetchResult)
            guard changes.hasIncrementalChanges else { return }
            photoCollectionView.performBatchUpdates({
                guard let inserted = changes.insertedIndexes, inserted.count > 0 else { return }
                photoCollectionView.insertItems(at: inserted.map { IndexPath(item: $0, section: 0) })
            })
        }
    }
}
