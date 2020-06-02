//
//  FinishGoalVC.swift
//  GoalPostApp
//
//  Created by Gustavo Mac Mini on 01/06/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit
import CoreData

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
        if pointsTextField.text != "" {
            save { (saved) in
                if saved {
                    performSegue(withIdentifier: "GoalsUnwindSegue", sender: nil)
                }
            }
        }
    }
    
    @IBAction func onBackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Core Data methods
extension FinishGoalVC {
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            completion(true)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
}
