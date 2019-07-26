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
        collectionView?.reloadData()
    }

    /*
    //
    // MARK: - Navigation
    //
     
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
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

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    
}
