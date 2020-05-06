//
//  SkillVC.swift
//  Swoosh
//
//  Created by Gustavo Mac Mini on 05/05/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit

class SkillVC: UIViewController {
    
    var player: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("->", player ?? "Nothing")
    }

}
