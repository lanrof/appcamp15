//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Kacper Branicki on 26.07.2015.
//  Copyright (c) 2015 Kacper Branicki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var highScoreLabel: UILabel!
    
    let defaults = NSUserDefaults(suiteName: "group.com.gmail.lanrof2.RockPaperScissors")!
    
    func updateHighScore() {
        if let highscore = defaults.objectForKey("highscore") as? Int {
            highScoreLabel.text = "Watch highscore: \(highscore)"
        }
        else {
            highScoreLabel.text = "No highscore yet."
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        updateHighScore()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

