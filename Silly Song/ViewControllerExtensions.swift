//
//  ViewControllerExtensions.swift
//  Silly Song
//
//  Created by Vineet Joshi on 12/27/17.
//  Copyright © 2017 Vineet Joshi. All rights reserved.
//

import Foundation

// must always import UIKit!
import UIKit

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // this function hides the keyboard and triggers the 'Editing Did End' event!
        textField.resignFirstResponder()
        return false
    }
}
