//
//  ViewController.swift
//  UDSettingsTask
//
//  Created by Jon Boling on 4/26/18.
//  Copyright © 2018 Walt Boling. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var listName: UITextField!
    @IBOutlet weak var sliderValue: UITextField!
    @IBOutlet weak var enabledValue: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        //let settingsSlider =
        let toggleButton = userDefaults.bool(forKey: "Enabled")
        let sliderString = String(describing: userDefaults.float(forKey: "Slider"))
        
        listName.text = userDefaults.object(forKey: "ListName") as? String
        sliderValue.text = sliderString
        
        if toggleButton == true {
            return enabledValue.text = "On"
        } else {
            return enabledValue.text = "Off"
        }
        
    }
}

