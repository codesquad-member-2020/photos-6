//
//  ViewController.swift
//  PhotosApp
//
//  Created by Cory Kim on 2020/03/16.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

