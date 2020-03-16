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
    let dataSource = PhotoCollectionViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        photoCollectionView.dataSource = dataSource
    }
}
