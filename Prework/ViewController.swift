//
//  ViewController.swift
//  Prework
//
//  Created by Garrett B. on 8/15/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var tipTitle: UILabel!
    @IBOutlet weak var totalTitle: UILabel!
    
    // Initializes UserDefaults for all functions
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Sets the title in the Navigation Bar
        self.title = "Get the Tip"
        
        // Sets keyboard to a decimal pad to avoid incorrect strings
        billAmountTextField.keyboardType = .decimalPad
        
        // Checks if tips already set via UserDefaults and loads them
        if let tip1 = defaults.string(forKey: "tip1") {
            self.tipControl.setTitle(tip1 + "%", forSegmentAt: 0)
        } else {
            self.tipControl.setTitle("15%", forSegmentAt: 0)
            defaults.set("15", forKey: "tip1")
        }
        if let tip2 = defaults.string(forKey: "tip2") {
            self.tipControl.setTitle(tip2 + "%", forSegmentAt: 1)
        } else {
            self.tipControl.setTitle("18%", forSegmentAt: 1)
            defaults.set("18", forKey: "tip2")
        }
        if let tip3 = defaults.string(forKey: "tip3") {
            self.tipControl.setTitle(tip3 + "%", forSegmentAt: 2)
        } else {
            self.tipControl.setTitle("20%", forSegmentAt: 2)
            defaults.set("20", forKey: "tip3")
        }
        //Checks if dark mode is on and adjusts UI Colors as needed
        if defaults.bool(forKey: "dark") == true {
            self.view.backgroundColor = UIColor.black
            tipAmountLabel.textColor = UIColor.white
            billLabel.textColor = UIColor.white
            tipTitle.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            totalTitle.textColor = UIColor.white
            tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
            tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.selected)
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        // Gets tip values from UserDefaults or grabs default values
        let tip1 = defaults.string(forKey: "tip1") ?? "15"
        let tip2 = defaults.string(forKey: "tip2") ?? "18"
        let tip3 = defaults.string(forKey: "tip3") ?? "20"
        // Sets Segment titles in tipControl with new defaults
        self.tipControl.setTitle(tip1 + "%", forSegmentAt: 0)
        self.tipControl.setTitle(tip2 + "%", forSegmentAt: 1)
        self.tipControl.setTitle(tip3 + "%", forSegmentAt: 2)
        // Sets UI Colors to handle dark mode
        if defaults.bool(forKey: "dark") == true {
            self.view.backgroundColor = UIColor.black
            tipAmountLabel.textColor = UIColor.white
            billLabel.textColor = UIColor.white
            tipTitle.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            totalTitle.textColor = UIColor.white
            tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
            tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.selected)
        } else {
            self.view.backgroundColor = UIColor.white
            tipAmountLabel.textColor = UIColor.black
            billLabel.textColor = UIColor.black
            tipTitle.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            totalTitle.textColor = UIColor.black
            tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.normal)
        }
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Gets user input in billAmountTextField
        let bill = Double(billAmountTextField.text!) ?? 0
        // Gets Tip value from segmented index and prepares it for transition to double type
        var selectedTip = String(self.tipControl.titleForSegment(at: self.tipControl.selectedSegmentIndex)!)
        selectedTip = selectedTip.replacingOccurrences(of: "%", with: "")
        let tipPercentage = Double(selectedTip) ?? 0
        // Calculates tip and total
        let tip = bill * tipPercentage / 100
        let total = bill + tip
        // Formats and displays tip and total
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
    }
    
}

