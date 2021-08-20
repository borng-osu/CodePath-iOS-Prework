//
//  SettingsViewController.swift
//  Prework
//
//  Created by Garrett B. on 8/16/21.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var tip1Label: UILabel!
    @IBOutlet weak var tip2Label: UILabel!
    @IBOutlet weak var tip3Label: UILabel!
    @IBOutlet weak var darkLabel: UILabel!
    @IBOutlet weak var tipOneText: UITextField!
    @IBOutlet weak var tipTwoText: UITextField!
    @IBOutlet weak var tipThreeText: UITextField!
    @IBOutlet weak var darkSwitch: UISwitch!
    @IBOutlet weak var percent1: UILabel!
    @IBOutlet weak var percent2: UILabel!
    @IBOutlet weak var percent3: UILabel!
    //Initializes UserDefaults to be used across all functions
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Get the Tip"
        // Sets text fields to use decimal keyboard pads to avoid incorrect strings
        tipOneText.keyboardType = .decimalPad
        tipTwoText.keyboardType = .decimalPad
        tipThreeText.keyboardType = .decimalPad
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Fills text fields with current tip values if previously set
        if let tip1 = defaults.string(forKey: "tip1") {
            tipOneText.text = tip1
        }
        if let tip2 = defaults.string(forKey: "tip2") {
            tipTwoText.text = tip2
        }
        if let tip3 = defaults.string(forKey: "tip3") {
            tipThreeText.text = tip3
        }
        // Sets UI Colors and settings if dark mode is on
        if defaults.bool(forKey: "dark") == true {
            self.view.backgroundColor = UIColor.black
            tip1Label.textColor = UIColor.white
            tip2Label.textColor = UIColor.white
            tip3Label.textColor = UIColor.white
            darkLabel.textColor = UIColor.white
            percent1.textColor = UIColor.white
            percent2.textColor = UIColor.white
            percent3.textColor = UIColor.white
            header.textColor = UIColor.white
            darkSwitch.setOn(true, animated: true)
        }
    }
    
    @IBAction func setTipOne(_ sender: Any) {
        // Gets text from text field
        let tip1 = tipOneText.text!
        // Sets relevant key in user defaults and handles empty string
        if tip1 == "" {
            defaults.set("15", forKey: "tip1")
        } else {
            defaults.set(tip1, forKey: "tip1")
        }
        defaults.synchronize()
    }
    
    @IBAction func setTipTwo(_ sender: Any) {
        // Gets text from text field
        let tip2 = tipTwoText.text!
        // Sets relevant key in user defaults and handles empty string
        if tip2 == "" {
            defaults.set("18", forKey: "tip2")
        } else {
            defaults.set(tip2, forKey: "tip2")
        }
        defaults.synchronize()
    }
    
    @IBAction func setTipThree(_ sender: Any) {
        // Gets text from text field
        let tip3 = tipThreeText.text!
        // Sets relevant key in user defaults and handles empty string
        if tip3 == "" {
            defaults.set("20", forKey: "tip3")
        } else {
            defaults.set(tip3, forKey: "tip3")
        }
        defaults.synchronize()
    }
    
    
    @IBAction func setDark(_ sender: Any) {
        // Sets UI Colors for screen once switch is on
        if darkSwitch.isOn {
            self.view.backgroundColor = UIColor.black
            tip1Label.textColor = UIColor.white
            tip2Label.textColor = UIColor.white
            tip3Label.textColor = UIColor.white
            darkLabel.textColor = UIColor.white
            header.textColor = UIColor.white
            percent1.textColor = UIColor.white
            percent2.textColor = UIColor.white
            percent3.textColor = UIColor.white
            defaults.set(true, forKey: "dark")
        } else {
            // Sets UI Colors for screen when switch turned off
            self.view.backgroundColor = UIColor.white
            tip1Label.textColor = UIColor.black
            tip2Label.textColor = UIColor.black
            tip3Label.textColor = UIColor.black
            darkLabel.textColor = UIColor.black
            header.textColor = UIColor.black
            percent1.textColor = UIColor.black
            percent2.textColor = UIColor.black
            percent3.textColor = UIColor.black
            defaults.set(false, forKey: "dark")
        }
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
