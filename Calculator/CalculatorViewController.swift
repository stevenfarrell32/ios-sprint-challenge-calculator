//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
   
    var brain: CalculatorBrain?
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        brain = CalculatorBrain()
        
    }
    // MARK: - Action Handlers
    // line 32 is showing the result of our function being ran and showing on storyboard
    // line 31 is running the entire functionality that we made in our calculatorBrain
    @IBAction func operandTapped(_ sender: UIButton)
    {
        if let numberTapped = sender.titleLabel?.text {
            if let brain = brain {
                let output = brain.addOperandDigit(digit: numberTapped)
                outputLabel.text = output
            }
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton)
    {
        if let myOperatorTapped = sender.titleLabel?.text {
            if let brain = brain {
                brain.setOperatorType(myOperatorTapped: myOperatorTapped)
            }
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let brain = brain {
            let output = brain.calculateIfPossible()
            outputLabel.text = output
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton? = nil) {
       clearTransaction()
        outputLabel.text = "0"
    }
    
    
    // MARK: - Private
    
    private func clearTransaction() {
     brain = nil
    brain = CalculatorBrain()
    }
}

