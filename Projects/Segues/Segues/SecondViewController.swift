//
//  SecondViewController.swift
//  Segues
//
//  Created by Gustavo Mac Mini on 09/04/19.
//  Copyright © 2019 DEVX. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var textPassed: String?

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let text = textPassed {
            label.text = text
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
