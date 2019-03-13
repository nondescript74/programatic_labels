//
//  EvenBetterViewController.swift
//  TestButtons
//
//  Created by Zahirudeen Premji on 3/13/19.
//  Copyright © 2019 Zahirudeen Premji. All rights reserved.
//

import UIKit

class EvenBetterViewController: UIViewController {
    
    
    // MARK: - Private internal variables to create labels and images
    private var masterString = "M"
    private var aString = "A"
    private var bString = "B"
    
    private var masterImage:UIImage = UIImage.init(named: "drink")!
    private var aImage:UIImage = UIImage.init(named: "drink")!
    private var bImage:UIImage = UIImage.init(named: "drink")!

    private var buttonLabelDict: NSDictionary = NSDictionary()
    private var buttonImageDict: NSDictionary = NSDictionary()
    
    
    // MARK: - Actions - all buttons
    //
    @IBAction func button(_ sender: UIButton) {
        // generic button
        
        switch sender.tag {
        case 0:
            setMasterAndTheOthers()
        case 2:
            setB()
        case 1:
            setA()
        default:
            fatalError("unknown tag in collection sent in")
        }
    }
    
    @IBOutlet var buttonOutletColl: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postAll()
    }
    
    private func setAllButtonAttributedLabels() {
        
        for anyItem in buttonOutletColl {
            switch anyItem.tag {
            case 0, 1, 2:
                anyItem.setAttributedTextWithImagePrefix(image: buttonImageDict.value(forKey: anyItem.tag.description) as! UIImage, text: buttonLabelDict.value(forKey: anyItem.tag.description) as! String, for: .normal)
            default:
                fatalError("unknown tag in collection sent in")
            }
        }
    }
    
    private func postAll()      {
        
        buttonLabelDict = NSDictionary.init(objects: [masterString, aString, bString], forKeys: ["0" as NSCopying, "1" as NSCopying, "2" as NSCopying])
        buttonImageDict = NSDictionary.init(objects: [masterImage, aImage, bImage], forKeys: ["0" as NSCopying, "1" as NSCopying, "2" as NSCopying])
        setAllButtonAttributedLabels()
    }
    
    
    private func setA() {
        masterString = buttonLabelDict.value(forKey: "0") as! String
        aString = "A set by itself"
        bString = buttonLabelDict.value(forKey: "2") as! String
        
        aImage = UIImage(named: "button_normal")!
        
        postAll()
    }
    
    
    private func setB() {
        
        masterString = buttonLabelDict.value(forKey: "0") as! String
        aString = buttonLabelDict.value(forKey: "1") as! String
        bString = "B set by itself"
        
        bImage = UIImage(named: "button_normal")!
        
        postAll()
        
    }
    private func setMasterAndTheOthers() {
        
        masterString =  "Master Z sets all"
        aString = "A set by Master"
        bString = "B set by Master"
        
        masterImage = UIImage(named: "peppers")!
        aImage = UIImage(named: "button_yellow")!
        bImage = UIImage(named: "button_blue")!
        
        postAll()
    }

}
