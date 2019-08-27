//
//  ViewController.swift
//  Swift Fun
//
//  Created by Milhouse Tattoos on 8/22/19.
//  Copyright © 2019 Estudie Ingles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var totalTextfield: UITextField!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var MyFirstLabel: UILabel!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
     
         if let totalText = totalTextfield.text {
             if let total = Double(totalText){
                 if let tipText = tipTextField.text {
                     if let tipPercentage = Double(tipText){
                         let tip = total * tipPercentage/100
                         if tip > 50.0 {
                             MyFirstLabel.text = "Tip: $\(tip)"
                         } else {
                             MyFirstLabel.text = "Tip: $\(tip)"
                         }
                     }
                 }
             }
         }
                 
        
                 

        
        
        
//        count = count + 1
//        MyFirstLabel.text = String(count)
//        if count >= 10 {
//            view.backgroundColor = UIColor.green
//        }
   
    }
    
}

