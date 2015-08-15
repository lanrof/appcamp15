//
//  InterfaceController.swift
//  PersonalTrainer WatchKit Extension
//
//  Created by Marta Wozniak on 15/08/15.
//  Copyright (c) 2015 Marta Wozniak. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var InfoLabel: WKInterfaceLabel!
    @IBOutlet weak var exerciseImage: WKInterfaceImage!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let dictionary = context as? NSDictionary, excercise = dictionary["excercise"] as? String, count = dictionary["Repeats"] as? Float, duration = dictionary["duration"] as? Float
        {
            var timer = NSTimer.scheduledTimerWithTimeInterval(Double( duration * count ), target: self, selector: Selector("update"), userInfo: nil, repeats: true)
            exerciseImage.setImageNamed(excercise)
            exerciseImage.startAnimatingWithImagesInRange(NSMakeRange(0, 17), duration: NSTimeInterval(duration), repeatCount: Int(count))
            
        }
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

    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }
    */
    func update() {
        InfoLabel.setText("Well done.")
        
    }
}
