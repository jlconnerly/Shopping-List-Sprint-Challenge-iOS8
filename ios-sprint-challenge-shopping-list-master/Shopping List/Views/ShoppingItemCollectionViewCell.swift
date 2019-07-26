//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Jake Connerly on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    //
    // MARK: - IBOutlets and Properties
    //
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    
    //
    // MARK: - Methods
    //
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        let photoData = shoppingItem.imageData
    
        itemImageView.image = UIImage(data: photoData)
        itemNameLabel.text = shoppingItem.name
        
        
        if shoppingItem.added == true {
            addedLabel.text = "Added"
        }else {
            addedLabel.text = "Not Added"
        }
    }
    
    
}
