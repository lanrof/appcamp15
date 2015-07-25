//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by appcamp on 25/07/15.
//  Copyright (c) 2015 Dawid Guze. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    var operation : String = "="
    var operand1 : Double = 0
    var operand2 : Double = 0
    
    func calculate() -> Double{
        switch operation {
            case "+": return operand1 + operand2
            case "-": return operand1 - operand2
            case "*": return operand1 * operand2
            case "/": return operand1 == 0 ? 0 : operand1 / operand2
        default: return 0
        }
    }
    
}