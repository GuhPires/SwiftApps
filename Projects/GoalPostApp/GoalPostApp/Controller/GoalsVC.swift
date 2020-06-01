//
//  GoalsVC.swift
//  GoalPostApp
//
//  Created by Gustavo Mac Mini on 01/06/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func onCreatePressed(_ sender: Any) {
        print("Creating...");
    }
    
}

