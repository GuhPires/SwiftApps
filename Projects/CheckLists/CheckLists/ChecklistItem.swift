//
//  ChecklistItem.swift
//  CheckLists
//
//  Created by Gustavo Mac Mini on 11/03/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text: String = ""
    var checked: Bool = false
    
    init(text: String, checked: Bool) {
        self.text = text
        self.checked = checked
    }
    
    func toggleChecked() {
        self.checked = !self.checked
    }
}
