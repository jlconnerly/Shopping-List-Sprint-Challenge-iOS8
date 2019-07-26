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
    
    
    
    var itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var initList: [ShoppingItem] = []
    var shoppingList: [ShoppingItem] = []
    
    
    
    
    func loadShoppingList() {
        for item in itemNames {
            guard let image = UIImage(named: item),
                  let imageData = UIImagePNGRepresentation(image) else { return }
            
            let shoppingItem = ShoppingItem(name: item, imageData: imageData)
            initList.append(shoppingItem)
        }
    }
    
    
    
    func toggleAdded(item: ShoppingItem) {
        if item.added != nil {
            item.added?.toggle()
        }
        saveToPersistantStore()
    }
    
    init() {
        loadShoppingList()
        loadFromPersistantStore()
    }
    
    //
    // MARK: - PERSISTANCE
    //
    
    private var persistantFileURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("shoppinglist.plist")
    }
    
    func saveToPersistantStore() {
        guard let url = persistantFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList)
            try data.write(to: url)
        }catch {
            print("error saving shoppingList data: \(error)")
        }
    }
    
    func loadFromPersistantStore() {
        let fm = FileManager.default
        guard let url = persistantFileURL,
            fm.fileExists(atPath: url.path) else { return }
        
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
            
        }catch{
            print("Error loading shoppingList: \(error)")
        }
    }
    
}
