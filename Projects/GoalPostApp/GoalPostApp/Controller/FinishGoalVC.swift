//
//  FinishGoalVC.swift
//  GoalPostApp
//
//  Created by Gustavo Mac Mini on 01/06/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    // MARK: - Global variables/constants
    var goalDescription: String!
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pointsTextField.delegate = self
        
        createGoalBtn.bindToKeyboard()
    }
    
    // MARK: - Custom methods
    func initData(description: String, type: GoalType) {
        print("Description: ", description, " Type: ", type)
        self.goalDescription = description
        self.goalType = type
    }
    
    // MARK: - Actions
    @IBAction func onCreateGoalPressed(_ sender: Any) {
    }
}
