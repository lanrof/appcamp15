//
//  InterfaceController.swift
//  Calculator WatchKit Extension
//
//  Created by appcamp on 25/07/15.
//  Copyright (c) 2015 Dawid Guze. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var displayLabel: WKInterfaceLabel!

    var display = "0"
    var operand1 = "0"
    var operation = "="
    var isUserInTheMiddleOfTypingNumber = false
    let initialDigits = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    let initialOperations = ["+", "-", "*", "/", "="]
    
    @IBAction func pushDigit() {
        presentTextInputControllerWithSuggestions(initialDigits, allowedInputMode: .Plain, completion: { (selectedDigit) -> Void in
            if let digit = selectedDigit[0] as? String {
            if self.isUserInTheMiddleOfTypingNumber {
                self.display = self.display + digit
            }
            else {
                self.display = digit
                self.isUserInTheMiddleOfTypingNumber = true
            }
            }
            
            self.displayLabel.setText(self.display)
        })
    }

    @IBAction func pushOperation() {
        
        presentTextInputControllerWithSuggestions(initialOperations, allowedInputMode : .Plain) { (selectedOperation) -> Void in
            
            if let operation = selectedOperation[0] as? String {
                switch operation {
                    case "+": self.processOperation("+")
                    case "-": self.processOperation("-")
                    case "*": self.processOperation("*")
                    case "/": self.processOperation("/")
                    case "=": self.processEquals()
                default: self.display = "0"
                }
                self.isUserInTheMiddleOfTypingNumber = false
            }
        }
    }
        
    func processOperation(op : String) {
        operation = op
        operand1 = display
        displayLabel.setText(op)
    }
        
    func processEquals() {
        let infoDictionary = ["operand1": operand1, "operand2": display, "operation" : operation]
        
        WKInterfaceController.openParentApplication(infoDictionary)
        {
            (replyDictionary, error) -> Void in
            
            if let castedResponseDictionary = replyDictionary as? [String: Double],
            responseMessage = castedResponseDictionary["result"]{
                self.displayLabel.setText("\(responseMessage)")
            }
        }
    }
    
    
    
    
    
    
    
    
    
}





