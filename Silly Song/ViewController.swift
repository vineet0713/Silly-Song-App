//
//  ViewController.swift
//  Silly Song
//
//  Created by Vineet Joshi on 12/13/17.
//  Copyright © 2017 Vineet Joshi. All rights reserved.
//

import UIKit

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

// Because shortName and lyrics are pure functions, they should be placed outside of class declaration:
func shortName(from name: String) -> String {
    var name = name
    name = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeioöu")
    var index = 0
    for character in name.unicodeScalars {
        if vowelSet.contains(character) {
            break
        }
        index += 1
    }
    let start = name.index(name.startIndex, offsetBy: index)
    return String(name[start..<(name.endIndex)])
}

func lyrics(for name: String, template: String) -> String {
    return template.replacingOccurrences(of: "<FULL_NAME>", with: name).replacingOccurrences(of: "<SHORT_NAME>", with: shortName(from: name))
}



// Pure functions:
// (as review:
// Pure functions are functions that do not possess any side effects,
// which means they do not change any data or state outside of themselves
// Pure functions only operate on their parameters, not any other data



class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    // action connection for "Editing Did Begin"
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    // action connection for "Editing Did End"
    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text!.isEmpty {
            return
        }
        let capitalizedName = nameField.text!.capitalizingFirstLetter()
        nameField.text = capitalizedName
        lyricsView.text = lyrics(for: capitalizedName, template: bananaFanaTemplate)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // tells the TextField to use our view controller as its delegate
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

