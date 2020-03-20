//
//  ViewController.swift
//  PhotosApp
//
//  Created by Cory Kim on 2020/03/16.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    private let delegateFlowLayout = PhotoCollectionViewDelegateFlowLayout()
    private let dataSource = PhotoCollectionViewDataSource()
    private let navigationBarTitle = "Photos"
    static let minimumItemSpacing: CGFloat = 2
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBAction func addImageButtonTapped(_ sender: UIBarButtonItem) {
        // dataSource 쪽에서 처리 구현 예정
    }
    
    @IBAction func presentDoodleCollectionViewController(_ sender: UIBarButtonItem) {
        let layout = UICollectionViewFlowLayout()
        let doodleCollectionView = DoodleCollectionViewController(collectionViewLayout: layout)
        let navigationController = UINavigationController(rootViewController: doodleCollectionView)
        navigationController.modalPresentationStyle = .overFullScreen
        self.present(navigationController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBarTitle()
        setupNotification()
        setupPropertiesConfiguration()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: PhotoCollectionViewDataSource.PhotoLibraryChangedNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: PhotoCollectionViewDelegateFlowLayout.SelectedItemsCountHasChanged, object: nil)
    }
    
    private func setupNavigationBarTitle() {
        navigationItem.title = navigationBarTitle
    }
    
    private func setupCollectionView() {
        photoCollectionView.dataSource = dataSource
        photoCollectionView.delegate = delegateFlowLayout
        photoCollectionView.allowsMultipleSelection = true
        setupCollectionViewLayout()
    }
    
    private func setupCollectionViewLayout() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = ViewController.minimumItemSpacing
        layout.minimumInteritemSpacing = ViewController.minimumItemSpacing
        photoCollectionView.collectionViewLayout = layout
    }
    
    private func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handlePhotoChanged), name: PhotoCollectionViewDataSource.PhotoLibraryChangedNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handlSelectedChanged), name: PhotoCollectionViewDelegateFlowLayout.SelectedItemsCountHasChanged, object: nil)
    }
    
    private func setupPropertiesConfiguration() {
        doneButton.isEnabled = false
    }
    
    @objc private func handlSelectedChanged(notification: Notification) {
        guard let count = notification.userInfo?["count"] as? Int else { return }
        guard let index = notification.userInfo?["index"] as? Int else { return }
        guard let isDeselected = notification.userInfo?["isDeselected"] as? Bool else { return }
        
        doneButton.isEnabled = count >= PhotoCollectionViewDelegateFlowLayout.minimnumNumberForVideo
    }
    
    @objc private func handlePhotoChanged(notification: Notification) {
        guard let inserted = notification.userInfo?["inserted"] as? IndexSet else { return }
        
        DispatchQueue.main.sync {
            photoCollectionView.performBatchUpdates({
                photoCollectionView.insertItems(at: inserted.map { IndexPath(item: $0, section: 0) })
            })
        }
    }
}
