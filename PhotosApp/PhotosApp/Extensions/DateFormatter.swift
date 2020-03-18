//
//  DateFormatter.swift
//  PhotosApp
//
//  Created by Cory Kim on 2020/03/18.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let doodleDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter
    }()
}
