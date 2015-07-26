//
//  InterfaceController.swift
//  CaloriesCounter WatchKit Extension
//
//  Created by appcamp on 25/07/15.
//  Copyright (c) 2015 Dawid Guze. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var caloriesLabel: WKInterfaceLabel!
    @IBOutlet weak var slider: WKInterfaceSlider!
    
    @IBOutlet weak var soFarLabel: WKInterfaceLabel!
    
    var calories : Int = 100
    var caloriesTotal : Int = 0
    var isHidden : Bool = false
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        caloriesTotal = defaults.integerForKey("caloriesTotal")
        soFarLabel.setText("\(caloriesTotal)")
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func minusButtonTapped() {
        calories = calories - 100
        slider.setValue(Float(calories))
        updateScreen()
    }
    
    @IBAction func plusButtonTapped() {
        calories = calories + 100
        slider.setValue(Float(calories))
        updateScreen()
    }
    
    @IBAction func addButtonTapped() {
        caloriesTotal = caloriesTotal + calories
        updateScreen()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(caloriesTotal, forKey: "caloriesTotal")
        
    }
    
    func updateScreen() {
        caloriesLabel.setText("\(calories)")
        soFarLabel.setText("\(caloriesTotal)")
    }
    
    @IBAction func hideSlider() {
        isHidden = !isHidden
        
        slider.setHidden( isHidden)
    }
    
    @IBAction func sliderChanged(value: Float) {
        calories = Int(value)
        updateScreen()
    }
}






