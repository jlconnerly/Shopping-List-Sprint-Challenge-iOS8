//
//  AddShoppingItemViewController.swift
//  Shopping List
//
//  Created by Jake Connerly on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AddShoppingItemViewController: UIViewController {
    
    //
    // MARK: - IBOutlets and Properties
    //
    
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingListController: ShoppingListController?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //
    // MARK: - IBActions and Methods
    //

    @IBAction func sendOrderButtonTapped(_ sender: UIButton) {
        guard let userName = nameTextField.text,
              !userName.isEmpty,
              let userAddress = addressTextField.text,
              !userAddress.isEmpty else { return }
        let alert = UIAlertController(title: "\(userName)", message: "Your order will be delivered to \(userAddress) in 15 minutes!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Awesome!", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func updateViews() {
        guard let shoppingController = shoppingListController else { return }
        var itemCount = 0
        for shoppingItem in shoppingController.shoppingList {
            if shoppingItem.added == true {
                itemCount += 1
            }
        }
        itemCountLabel.text = String("You have \(itemCount) item(s) in your cart.")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
