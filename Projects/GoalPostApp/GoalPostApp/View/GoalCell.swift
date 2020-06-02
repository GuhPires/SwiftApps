//
//  GoalCell.swift
//  GoalPostApp
//
//  Created by Gustavo Mac Mini on 01/06/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    func configureCell(goal: Goal) {
        goalDescriptionLbl.text = goal.goalDescription
        goalTypeLbl.text = goal.goalType
        goalProgressLbl.text = "\(goal.goalProgress)"
    }
}
