//
//  ViewController.swift
//  IOSCalculator
//
//  Created by user on 16/11/22.
//

import UIKit

class ViewController: UIViewController {

    var operand: String = ""
    var numberOne: String = ""
    var numberTwo: String = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    
    // function for numbers 0..9
    @IBAction func inputNumber(_ sender: UIButton) {
        if operand.isEmpty{
            numberOne += (sender.titleLabel?.text)!
            resultLabel.text = numberOne
        } else{
            numberTwo += (sender.titleLabel?.text)!
            resultLabel.text = numberTwo
        }
    }
        
    @IBAction func clearAction(_ sender: UIButton) {
        operand = ""
        numberOne = ""
        numberTwo = ""
        resultLabel.text = "0"
    }
    
    // function for + - / *
    @IBAction func inputOperand(_ sender: UIButton) {
        guard !numberOne.isEmpty else{ return }
        operand = (sender.titleLabel?.text)!
        print(operand)
    }
    
    @IBAction func resultAction(_ sender: Any){
        var result: Double = 0.0
        
        switch operand{
        case "/":
            guard !isZero(number: numberTwo) else {return resultLabel.text = "Error"}
            result = Double(numberOne)! / Double(numberTwo)!
            print(operand)
        case "*":
            result = Double(numberOne)! * Double(numberTwo)!
            print(operand)
        case "-":
            result = Double(numberOne)! - Double(numberTwo)!
            print(operand)
        case "+":
            result = Double(numberOne)! + Double(numberTwo)!
        default:
            break
        }
        
        showResult(number: result)
        numberOne = ""
        numberTwo = ""
        operand = ""
    }
    
    func showResult(number: Double){
        if number.truncatingRemainder(dividingBy: 1.0) == 00 {
            resultLabel.text = String(Int(number))
        } else{
            resultLabel.text = String(number)
        }
    }
    
    func isZero(number: String) -> Bool{
        guard number == "0" else { return false }
        return true
        }
    }
