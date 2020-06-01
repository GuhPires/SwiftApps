//
//  UIViewControllerExt.swift
//  GoalPostApp
//
//  Created by Gustavo Mac Mini on 01/06/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentDetail(_ viewContrtollerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        view.window?.layer.add(transition, forKey: kCATransition)
        present(viewContrtollerToPresent, animated: false, completion: nil)
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
}
