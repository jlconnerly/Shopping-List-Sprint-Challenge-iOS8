//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Jake Connerly on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    //
    //MARK: - IBOutlets and Properties
    //
    
    let shoppingListController = ShoppingListController()
    let addedHelper = AddedHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingListController.loadFromPersistantStore()
        collectionView?.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        shoppingListController.loadFromPersistantStore()
        collectionView?.reloadData()
    }
    
    //
    // MARK: - Methods
    //
    
    func toggleAdded() {
        guard let selection = addedHelper.added else { return }
        
        if selection == true {
            
        }
    }


    //
    // MARK: - Navigation
    //
     
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let addShoppingVC = segue.destination as? AddShoppingItemViewController else { return }
        addShoppingVC.shoppingListController = shoppingListController
    }

    
    //
    // MARK: UICollectionViewDataSource
    //

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        let shoppingItem = shoppingListController.shoppingList[indexPath.item]
        cell.shoppingItem = shoppingItem
    
        return cell
    }
    
    
    
    //
    // MARK: UICollectionViewDelegate
    //
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userDefaults = UserDefaults.standard
        let shoppingItem = shoppingListController.shoppingList[indexPath.item]
        shoppingListController.toggleAdded(item: shoppingItem)
        collectionView.reloadData()
        if shoppingListController.shoppingList[indexPath.item].added == true {
            userDefaults.set(true, forKey: AddedHelper.addedKey)
        }else {
            userDefaults.set(false, forKey: AddedHelper.addedKey)
        }
        shoppingListController.saveToPersistantStore()
        print("tap")
    }
    
    
    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    
}
