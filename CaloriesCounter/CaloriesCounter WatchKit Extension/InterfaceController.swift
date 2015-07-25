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
    
    var calories = 100
    var caloriesTotal = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func minusButtonTapped() {
        calories = calories - 25
        updateScreen()
    }
    
    @IBAction func plusButtonTapped() {
        calories = calories + 25
        updateScreen()
    }
    
    @IBAction func addButtonTapped() {
        caloriesTotal = caloriesTotal + calories
    }
    
    func updateScreen() {
        caloriesLabel.setText("\(calories)")
    }
    
}
