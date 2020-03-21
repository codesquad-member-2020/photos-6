//
//  DoodleButton.swift
//  PhotosApp
//
//  Created by Cory Kim on 2020/03/21.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class DoodleButton: UIBarButtonItem {
    
    var numberOfSelectedPhotos: Int! = 0 {
        didSet {
            isEnabled = numberOfSelectedPhotos > 0 ? false : true
        }
    }
}
