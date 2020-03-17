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
    let delegateFlowLayout = PhotoCollectionViewDelegateFlowLayout()
    var dataSource: PhotoCollectionViewDataSource!
    let navigationBarTitle = "Photos"
    
    @IBAction func addImageButtonTapped(_ sender: UIBarButtonItem) {
        dataSource.addImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupNavigationBarTitle()
    }
    
    private func setupNavigationBarTitle() {
        navigationItem.title = navigationBarTitle
    }
    
    private func setupCollectionView(){
        dataSource = PhotoCollectionViewDataSource(for: photoCollectionView)
        photoCollectionView.dataSource = dataSource
        photoCollectionView.delegate = delegateFlowLayout
    }
}
