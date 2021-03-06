//
//  InterfaceController.swift
//  project1 WatchKit Extension
//
//  Created by appcamp on 8/15/15.
//  Copyright (c) 2015 appcamp. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var messageLabel: WKInterfaceLabel!
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

    @IBAction func buttonOperation() {
        WKInterfaceController.openParentApplication(["Name" : "Łukasz"], reply: { (reply, error) -> Void in
            
            if let responseMessage = reply["Message"] as? String {
                println(responseMessage)
                self.messageLabel.setText(responseMessage)
            }
        })
    }
    
    
}
