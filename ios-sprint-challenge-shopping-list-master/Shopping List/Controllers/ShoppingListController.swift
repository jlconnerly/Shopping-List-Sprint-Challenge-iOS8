//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Jake Connerly on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingListController {
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var shoppingList: [ShoppingItem] = []
    
    func loadShoppingList() {
        for item in itemNames {
            guard let image = UIImage(named: item),
                  let imageData = UIImagePNGRepresentation(image) else { return }
            
            let shoppingItem = ShoppingItem(name: item, imageData: imageData, added: false)
            shoppingList.append(shoppingItem)
        }
    }
    
    init() {
        loadShoppingList()
    }
    
}
