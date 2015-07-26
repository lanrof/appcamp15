//
//  InterfaceController.swift
//  RockPaperScissors WatchKit Extension
//
//  Created by Kacper Branicki on 26.07.2015.
//  Copyright (c) 2015 Kacper Branicki. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var resultLabel: WKInterfaceLabel!
    @IBOutlet weak var scoreLabel: WKInterfaceLabel!
    @IBOutlet weak var oponentPickSymbol: WKInterfaceImage!
    
    let defaults = NSUserDefaults(suiteName: "group.gmail.lanrof2.RockPaperScissors")!
    
    var score = 0
    var gamesCounter = 0
    var highscore = 0
    let symbols = ["rock", "paper", "scissors"]
    
    @IBAction func chooseRock() {
        play("rock")
    }
    
    @IBAction func choosePaper() {
        play("paper")
    }
    
    @IBAction func chooseScissors() {
        play("scissors")
    }
    
    func play(symbol: String)
    {
        gamesCounter = gamesCounter + 1
        
        let oponentPick = symbols[Int(arc4random_uniform(3))]
        
        oponentPickSymbol.setImage(UIImage(named: oponentPick))
        
        if oponentPick == symbol
        {
            resultLabel.setText("Tie. +1")
            score += 1
        }
        else
        {
            var won = false
            
            switch symbol
            {
                case "rock":
                    if oponentPick == "scissors"
                    {
                        won = true
                    }
                case "paper":
                    if oponentPick == "rock"
                    {
                        won = true
                    }
                case "scissors":
                    if oponentPick == "paper"
                    {
                        won = true
                    }
            default : resultLabel.setText("Unrecognised symbol")
            }
            
            if won
            {
                resultLabel.setText("You won. +5")
                score += 5
            }
            else
            {
                resultLabel.setText("You lost :(. -2")
                score -= 2
            } 
        }
        
        scoreLabel.setText("\(score)")
        updateHighScore()
    }
    
    @IBAction func showGameStats() {
        highscore = getHighScoreFromDefaults()
        
        pushControllerWithName("gameStats", context: ["currentScore" : "\(score)", "highScore" : "\(highscore)", "gamesPlayed" : "\(gamesCounter)"])
    }
    
    
    func getHighScoreFromDefaults() -> Int
    {
        var highScoreFromDefaults = defaults.objectForKey("highscore") as? Int
        
        return (highScoreFromDefaults != nil) ? highScoreFromDefaults! : 0
    }
    
    func updateHighScore()
    {
        highscore = getHighScoreFromDefaults()
        
        if(highscore < score)
        {
            defaults.setObject(score, forKey: "highscore")
            defaults.synchronize()
        }
    }
    
}
