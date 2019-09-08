//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


enum OperatorType: String {
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
}



class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(digit: String) -> String {
        if operatorType == nil {
            operand1String.append(contentsOf: digit)
            return operand1String
        } else {
            operand2String.append(contentsOf: digit)
            return operand2String
        }
    }
    func setOperatorType(myOperatorTapped: String) {
        operatorType = OperatorType(rawValue: myOperatorTapped)
    }
    func calculateIfPossible() -> String? {
        if operand1String != "" && operand2String != "" {
            if let operatorType = operatorType {
                if let operand1Double = Double(operand1String),
                    let operand2Double = Double(operand2String) {
                    switch operatorType {
                    case .addition:
                        return String(operand1Double + operand2Double)
                    case .subtraction:
                        return String(operand1Double - operand2Double)
                    case .division:
                        if operand2Double == 0 {
                            return "Error"
                        } else {
                            return String(operand1Double / operand2Double)
                        }
                    case .multiplication:
                        return String(operand1Double * operand2Double)
                    }
                }
            }
        }
        return "Error"
    }
}
