//
//  DoodleCollectionViewController.swift
//  PhotosApp
//
//  Created by Keunna Lee on 2020/03/18.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit
import Photos

class DoodleCollectionViewController: UICollectionViewController {
    
    private var indexPathOfSelectedCell : IndexPath?
    private let navigationBarTitle = "Doodles"
    private let delegateFlowLayout = DoodleCollectionViewDelegateFlowLayout()
    private let dataSource = DoodleCollectionViewDataSource()
    private var longPressGestureRecognizer: UILongPressGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupGestureRecognizer()
        setupNavigationBar()
        setupNotification()
        setupUI()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = dataSource
        collectionView.delegate = delegateFlowLayout
        collectionView.register(DoodleImageCell.self, forCellWithReuseIdentifier: DoodleImageCell.identifier)
        collectionView.backgroundColor = .darkGray
    }
    
    private func setupNavigationBar() {
        navigationItem.title = navigationBarTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "KeyColor")
    }
    
    private func setupGestureRecognizer() {
        longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPressGesture))
        longPressGestureRecognizer.minimumPressDuration = 1
        self.collectionView.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupUI() {
        self.collectionView.backgroundColor = .darkGray
    }
    
    private func setupNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reloadCollectionView),
                                               name: DoodleDataManager.DoodleImagesHaveDecodedNotification,
                                               object: nil)
    }
    
    @objc private func reloadCollectionView(notification: Notification) {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: DoodleDataManager.DoodleImagesHaveDecodedNotification,
                                                  object: nil)
        collectionView.removeGestureRecognizer(longPressGestureRecognizer)
    }
}

extension DoodleCollectionViewController {
    @objc func handleLongPressGesture(gesture: UILongPressGestureRecognizer){
        let location = gesture.location(in: self.collectionView)
        guard let indexPath = collectionView.indexPathForItem(at: location) else { return }
        indexPathOfSelectedCell = indexPath
        guard let selectedCell = collectionView.cellForItem(at: indexPath) else { return }
        let menuItem = UIMenuItem(title: "Save", action: #selector(saveImage))
        UIMenuController.shared.menuItems = [menuItem]
        UIMenuController.shared.showMenu(from: selectedCell, rect: selectedCell.contentView.frame)
        selectedCell.becomeFirstResponder()
    }
    
    @objc func saveImage() {
        guard let indexPath = indexPathOfSelectedCell else { return }
        let cell = collectionView.cellForItem(at: indexPath) as! DoodleImageCell
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: cell.doodleImage)
        })
    }
}
