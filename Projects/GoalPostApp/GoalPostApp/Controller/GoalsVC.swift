//
//  GoalsVC.swift
//  GoalPostApp
//
//  Created by Gustavo Mac Mini on 01/06/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
    }
    
    // MARK: - Actions
    @IBAction func onCreatePressed(_ sender: Any) {
        print("Creating...");
    }
    
}

// MARK: - Table View methods
extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return GoalCell() }
        cell.configureCell(description: "Eat salad twice a week", type: .shortTerm, goalProgress: 2)
        return cell
    }
}

