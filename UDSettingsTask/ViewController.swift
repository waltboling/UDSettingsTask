//
//  ViewController.swift
//  UDSettingsTask
//
//  Created by Jon Boling on 4/26/18.
//  Copyright © 2018 Walt Boling. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var listName: UITextField!
    @IBOutlet weak var sliderValue: UITextField!
    @IBOutlet weak var enabledValue: UITextField!
    
    struct SettingProperties {
        static let listName = "ListName"
        static let slider = "Slider"
        static let enabled = "Enabled"
    }
    
    func loadSettings() {
        listName.text = userDefaults.object(forKey: SettingProperties.listName) as? String
        sliderValue.text = String(describing: userDefaults.float(forKey: SettingProperties.slider))
        
        if userDefaults.bool(forKey: SettingProperties.enabled) == true {
            enabledValue.text = "On"
        } else {
            enabledValue.text = "Off"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSettings()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(applicationDidBecomeActive(notification:)),
            name: NSNotification.Name.UIApplicationDidBecomeActive,
            object: nil)
    }
    
    @objc func applicationDidBecomeActive(notification: NSNotification) {
        loadSettings()
    }
    
    
}

