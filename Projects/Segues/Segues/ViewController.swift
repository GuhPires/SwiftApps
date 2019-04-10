//
//  ViewController.swift
//  Segues
//
//  Created by Gustavo Mac Mini on 09/04/19.
//  Copyright © 2019 DEVX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "secondScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondScreen" {
            
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.textPassed = textField.text!
        }
    }
}

