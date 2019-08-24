//
//  ViewController.swift
//  Swift Fun
//
//  Created by Milhouse Tattoos on 8/22/19.
//  Copyright © 2019 Estudie Ingles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var MyFirstLabel: UILabel!
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        count = count + 1
        MyFirstLabel.text = String(count)
        if count >= 10 {
            view.backgroundColor = UIColor.green
        }
    }
    
}

