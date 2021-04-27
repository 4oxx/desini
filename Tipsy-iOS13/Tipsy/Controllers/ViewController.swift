//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLable: UILabel!
    
    
    var peoples = 2
    var tip = 0.1
    var endResult = "0.0"
    var billTotal = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
    zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle
        
        let buttonTitleDelLast = String(buttonTitle!.dropLast())
        let buttonTitleNew = Double(buttonTitleDelLast)!
        
        tip = buttonTitleNew / 100
            
        billTextField.endEditing(true)
        }
       
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
      let stepperValue = Int(sender.value).description
        sender.maximumValue = 12
       splitNumberLable.text = stepperValue
        peoples = Int(stepperValue)!
        
       
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            
            let result = billTotal * (1 + tip) / Double(peoples)
            
           endResult = String(format: "%.2f", result)
            print(endResult)
        
        //   print(tip)
      //  print(peoples)
        }else{
            print("Write something!")
        }
        performSegue(withIdentifier: "goToResult", sender: self)
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.result = endResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = peoples
        }
    }
   

}
