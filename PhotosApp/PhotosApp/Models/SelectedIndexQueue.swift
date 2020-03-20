//
//  SelectedIndexQueue.swift
//  PhotosApp
//
//  Created by Cory Kim on 2020/03/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class SelectedIndexQueue {
    var queue: [Int] = []
    
    func updateChanged(index: Int, isDeselected: Bool) {
        if !isDeselected {
            enqueue(indexValue: index)
        } else {
            dequeue(indexValue: index)
        }
    }
    
    func enqueue(indexValue: Int) {
        queue.append(indexValue)
    }
    
    func dequeue(indexValue: Int) {
        queue.enumerated().forEach { (queueIndex, index) in
            if index == indexValue {
                queue.remove(at: queueIndex)
                return
            }
        }
    }
}
