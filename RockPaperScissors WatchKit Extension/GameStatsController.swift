//
//  GameStatsController.swift
//  RockPaperScissors
//
//  Created by Kacper Branicki on 26.07.2015.
//  Copyright (c) 2015 Kacper Branicki. All rights reserved.
//

import Foundation
import WatchKit

class GameStatsController : WKInterfaceController
{
    @IBOutlet weak var currentScoreLabel: WKInterfaceLabel!
    @IBOutlet weak var highScoreLabel: WKInterfaceLabel!
    @IBOutlet weak var gamesPlayedLabel: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        
        if let value = context as? [String : String],
            currentScore = value["currentScore"],
            highScore = value["highScore"],
            gamesPlayed = value["gamesPlayed"]
        {
            currentScoreLabel.setText("\(currentScore)")
            highScoreLabel.setText("\(highScore)")
            gamesPlayedLabel.setText("\(gamesPlayed)")
        }
        
    }
}
