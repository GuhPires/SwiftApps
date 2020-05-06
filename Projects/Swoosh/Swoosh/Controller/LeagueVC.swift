//
//  LeagueVC.swift
//  Swoosh
//
//  Created by Gustavo Mac Mini on 05/05/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit

class LeagueVC: UIViewController {
    
    @IBOutlet weak var nextBtn: BorderButton!
    
    var player = Player()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "skillVCSegue" {
            let controller = segue.destination as! SkillVC
            controller.player = player
        }
    }

    @IBAction func onNextTapped(_ sender: Any) {
        performSegue(withIdentifier: "skillVCSegue", sender: self)
    }

    @IBAction func onLeagueSelection(_ sender: BorderButton) {
        player.desiredLeague = sender.titleLabel!.text
        nextBtn.isEnabled = true
    }
    
}
