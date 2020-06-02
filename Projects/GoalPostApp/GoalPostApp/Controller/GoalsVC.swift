//
//  GoalsVC.swift
//  GoalPostApp
//
//  Created by Gustavo Mac Mini on 01/06/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Global variables/constants
    var goals = [Goal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    // MARK: - Custom methods
    func fetchData() {
        fetch { (data) in
            if data {
                if goals.count > 0 {
                    self.tableView.isHidden = false
                } else {
                    self.tableView.isHidden = true
                }
            }
        }
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateGoalSegue" {
            // Pass data if needed
        }
    }
    
    @IBAction func goalWasCreated(_ unwindSegue: UIStoryboardSegue) {
        fetchData()
    }
    
    // MARK: - Actions
}

// MARK: - Table View methods
extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return GoalCell() }
        cell.configureCell(goal: goals[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "DELETE") { (action, view, completion) in
            tableView.beginUpdates()
            self.removeGoal(atIndexPath: indexPath)
            self.fetchData()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            completion(true)
        }
        action.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        return UISwipeActionsConfiguration(actions: [action])
    }
}

// MARK: - Core Data methods
extension GoalsVC {
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        
        do {
            goals = try managedContext.fetch(fetchRequest) as! [Goal]
            completion(true)
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func removeGoal(atIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        managedContext.delete(goals[indexPath.row])
        
        do {
            try managedContext.save()
        } catch {
            debugPrint("Could not remove: \(error.localizedDescription)")
        }
    }
}
