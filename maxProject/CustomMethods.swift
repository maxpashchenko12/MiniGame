//
//  CustomMethods.swift
//  maxProject
//
//  Created by Max on 28.12.17.
//  Copyright © 2017 Vladimir Timoshenko. All rights reserved.
//

import Foundation
import UIKit

class CustomMethods {

    struct Alerts {
        
        static func createAlert(titleText: String, messageText: String) -> UIAlertController {
            
            let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            
            return alert
        }
        
    }
    
}

