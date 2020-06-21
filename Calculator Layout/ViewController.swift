//
//  ViewController.swift
//  Calculator Layout
//
//  Created by Madhu on 11/05/20.
//  Copyright © 2020 Madhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
   @IBOutlet weak var displayLabel: UILabel!
    
     private var calculator = CalculatorLogic()
    
    private var isNumberTypingFinished: Bool = true
    
    private var displayValue : Double
    {
        get {
            guard let number = Double(displayLabel.text!)
                else
            {
                fatalError("Cannot Display To as Double")
            }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton)
    {
        isNumberTypingFinished = true
        
        calculator.setNumber(displayValue)
               
               if let calcMethod = sender.currentTitle
               {
        
                   if let result = calculator.calculate(symbol: calcMethod)
                   {
                       displayValue = result
                   }
               }
    }
    
  
    
    @IBAction func numButtonPressed(_ sender: UIButton)
    {
        
        if let numValue = sender.currentTitle
        {
            if isNumberTypingFinished
            {
                displayLabel.text      = numValue
                isNumberTypingFinished = false
            }
                
            else
            {
                if numValue == "."
                {
                    guard let currentDisplayValue = Double(displayLabel.text!) else
                    {
                        fatalError("Value cannot displayed in Double")
                        
                    }
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    
                    if (!isInt)
                    {
                        return
                    }
                    
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

