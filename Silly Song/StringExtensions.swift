//
//  StringExtensions.swift
//  Silly Song
//
//  Created by Vineet Joshi on 12/27/17.
//  Copyright © 2017 Vineet Joshi. All rights reserved.
//

import Foundation


// taken from: https://stackoverflow.com/questions/26306326/swift-apply-uppercasestring-to-only-the-first-letter-of-a-string
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
