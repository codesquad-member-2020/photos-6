//
//  DoodleCollectionViewController.swift
//  PhotosApp
//
//  Created by Keunna Lee on 2020/03/18.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class DoodleCollectionViewController: UICollectionViewController {
    
    private let navigationBarTitle = "Doodles"
    private let delegateFlowLayout = DoodleCollectionViewDelegateFlowLayout()
    private let dataSource = DoodleCollectionViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
        setupNotification()
        setupUI()
    }
    
    private func setupCollectionView() {
        self.collectionView.dataSource = dataSource
        self.collectionView.delegate = delegateFlowLayout
        self.collectionView.register(DoodleImageCell.self, forCellWithReuseIdentifier: DoodleImageCell.identifier)
    }

    private func setupNavigationBar() {
        navigationItem.title = navigationBarTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeButtonTapped))
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
    }
}
