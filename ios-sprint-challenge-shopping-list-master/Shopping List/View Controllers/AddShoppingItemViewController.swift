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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //
    // MARK: - IBActions and Methods
    //

    @IBAction func sendOrderButtonTapped(_ sender: UIButton) {
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
