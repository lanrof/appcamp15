//
//  MainInterfaceControler.swift
//  PersonalTrainer
//
//  Created by appcamp on 8/15/15.
//  Copyright (c) 2015 Marta Wozniak. All rights reserved.
//
import WatchKit
import Foundation

class MainInterfaceController : WKInterfaceController {
    
    @IBOutlet weak var RepeatsCountLabel: WKInterfaceLabel!
    var reperatsCount : Float = 3.0
    var selectedOption = 0
    var duration : Float = 2.0
    
    @IBOutlet weak var DurationLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
    }
    
    
    @IBAction func repeatsCountChange(value: Float) {
        reperatsCount = value;
        RepeatsCountLabel.setText("\(Int(reperatsCount)) Repeats")
        
    }
    
    @IBAction func crunches() {
        selectedOption = 1
    }
    
    @IBAction func twists() {
        selectedOption = 2
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        if segueIdentifier == "showCrunches"
        {
            return ["excercise" : "crunch", "Repeats" : reperatsCount, "duration" : duration]
        }
        else if segueIdentifier == "showTwists"{
            return ["excercise" : "twist", "Repeats" : reperatsCount, "duration" : duration]
        }
        
        return [:]
    }
    
    @IBAction func durationChange(value: Float) {
        duration = value
        DurationLabel.setText("\(duration) - speed")
    }
}