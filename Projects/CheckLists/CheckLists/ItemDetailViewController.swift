//
//  itemDetailViewController.swift
//  CheckLists
//
//  Created by Gustavo Mac Mini on 11/03/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding text: String, isChecked checked: Bool)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEdditing item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    
//    MARK: - Outlets
    @IBOutlet weak var cancelBarBtn: UIBarButtonItem!
    @IBOutlet weak var doneBarBtn: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
//      MARK: - Delegates
    weak var delegate: ItemDetailViewControllerDelegate?
    
//    MARK: - Global Variables
    var itemToEdit: ChecklistItem?
    
//    MARK: - Init Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            
            doneBarBtn.isEnabled = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Act as the text field is already in focus:
        textField.becomeFirstResponder()
    }
    
//    MARK: - Table View Methods
    
    // Negating cell selection
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
//    MARK: - Text Field Methods
    
    // USE THE FOLLOWING IF NO ACTION FROM THE TEXT FIELD WAS CONNECTED TO THE 'DONE' FUNCTION!
    // Tapping the return key
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        // Unfocusing the text field:
//        textField.resignFirstResponder()
//        return false
//    }
    
    // Handling the text
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newTxt = textField.text!.replacingCharacters(in: Range(range, in: textField.text!)!, with: string)
        if newTxt.isEmpty {
            doneBarBtn.isEnabled = false
        } else {
            doneBarBtn.isEnabled = true
        }
        
        return true
    }
    
//    MARK: - Custom Methods

//    MARK: - Action Methods
    
    // Cancel new item creation
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    
    // Create new item
    @IBAction func done(_ sender: Any) {
        if let itemToEdit = itemToEdit {
            itemToEdit.text = textField.text!
            delegate?.itemDetailViewController(self, didFinishEdditing: itemToEdit)
        } else {
            delegate?.itemDetailViewController(self, didFinishAdding: textField.text!, isChecked: false)
        }
    }
}
