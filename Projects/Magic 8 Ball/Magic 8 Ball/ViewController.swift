//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by 7waysiMac on 23/04/19.
//  Copyright © 2019 7waysiMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballImage: UIImageView!
    
    var randomNum : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeBallImage()
    }
    
    @IBAction func askButton(_ sender: Any) {
        changeBallImage()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        changeBallImage()
    }
    
    func changeBallImage(){
        randomNum = Int(arc4random_uniform(5))
        
        ballImage.image = UIImage(named: "ball\(randomNum + 1)")
    }

}

