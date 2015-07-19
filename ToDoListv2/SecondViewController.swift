//
//  SecondViewController.swift
//  ToDoListv2
//
//  Created by Appcamp on 19/07/15.
//  Copyright (c) 2015 Appcamp. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ItemName: UITextField!
    @IBOutlet weak var Details: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    @IBAction func addItem(sender: UIButton) {
        if ItemName.text.isEmpty {
            displayAlert()
        }
        else {
            itemsMgr.addItem(ItemName.text, details: Details.text)
            ItemName.text = ""
            Details.text = ""
            self.tabBarController?.selectedIndex = 0
        }
    }
    
    func displayAlert() {
        let alert = UIAlertController(title: "Empyt name", message: "You cannot save ite without a name", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
}

