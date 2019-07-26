//
//  AddedHelper.swift
//  Shopping List
//
//  Created by Jake Connerly on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class AddedHelper {
    
    //
    //MARK: - Properties
    //
    
    static let addedKey: String = ""
    
    var added: Bool? {
        let userDefaults = UserDefaults.standard
        let selection = userDefaults.bool(forKey: AddedHelper.addedKey)
        return selection
    }
    
    //
    //MARK: - Methods
    //
    

}
