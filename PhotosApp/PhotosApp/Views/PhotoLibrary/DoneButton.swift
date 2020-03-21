//
//  DoneButton.swift
//  PhotosApp
//
//  Created by Cory Kim on 2020/03/21.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class DoneButton: UIBarButtonItem {
    
    var numberOfSelectedPhotos: Int! {
        didSet {
            isEnabled = numberOfSelectedPhotos >= 3 ? true : false
        }
    }
}
