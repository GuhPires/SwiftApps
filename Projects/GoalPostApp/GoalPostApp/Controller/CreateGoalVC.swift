//
//  CreateGoalVC.swift
//  GoalPostApp
//
//  Created by Gustavo Mac Mini on 01/06/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var goalTxtView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func onShortTermBtnPressed(_ sender: Any) {
    }
    
    @IBAction func onLongTermBtnPressed(_ sender: Any) {
    }
    
    @IBAction func onNextBtnPressed(_ sender: Any) {
    }
    
    @IBAction func onBackBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
