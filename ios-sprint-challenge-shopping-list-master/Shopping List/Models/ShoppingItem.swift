//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jake Connerly on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItem: Codable {
    var name: String
    var imageData: Data
    var added: Bool
    
    init(name: String, imageData: Data, added: Bool) {
        self.name = name
        self.imageData = imageData
        self.added = false
    }
}
