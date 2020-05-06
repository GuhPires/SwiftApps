//
//  ViewController.swift
//  CheckLists
//
//  Created by Gustavo Mac Mini on 10/03/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, ItemDetailViewControllerDelegate {
//    MARK: - Global Variables
    var items = [ChecklistItem]()
    
    let newItems: [String: Bool] = ["Walk the dog": true, "Brush my teeth": false, "Learn iOS development": false, "Soccer practice": true, "Study": false, "Sleep": false, "Code": true]

//    MARK: - Init Methods
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        for (txt, ckd) in newItems {
            self.createItem(text: txt, checked: ckd)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! ItemDetailViewController
            controller.delegate = self
        } else if segue.identifier == "EditItem" {
            let controller = segue.destination as! ItemDetailViewController
            controller.delegate = self
            
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.itemToEdit = items[indexPath.row]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
//    MARK: - Delegate Methods
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        navigationController?.popViewController(animated: true)
    }

    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding text: String, isChecked checked: Bool) {
        createItem(text: text, checked: checked, updateTableView: true)

        navigationController?.popViewController(animated: true)
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEdditing item: ChecklistItem) {
        if let index = items.firstIndex(of: item) {
            if let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) {
                configureText(for: cell, with: item)
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
    
//    MARK: - Table View Methods
    
    // Telling Swift how many cells need to be created
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // Creating + Styling + Dequeuing cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    // Tapping into cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        let item = items[indexPath.row]
        item.toggleChecked()
        
        configureCheckmark(for: cell, with: item)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Swipe to delete functionality
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        
        // Update the Table View:
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
//    MARK: - Custom Methods
    
    // Creating new cell content
    func createItem(text: String, checked: Bool = false, updateTableView: Bool = false) {
        let newItem = ChecklistItem(text: text, checked: checked)
        items.append(newItem)
        
        if updateTableView {
            // Update the Table View:
            tableView.insertRows(at: [IndexPath(row: items.count - 1, section: 0)], with: .automatic)
        }
    }
    
    // Configuring cells checkmark
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        let label = cell.viewWithTag(1001) as! UILabel
        
        if item.checked {
            label.text = "√"
        } else {
            label.text = ""
        }
    }
    
    // Configuring cells label text
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
//    MARK: - Action Methods
    
}
