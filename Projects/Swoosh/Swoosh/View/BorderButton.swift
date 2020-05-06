//
//  BorderButton.swift
//  Swoosh
//
//  Created by Gustavo Mac Mini on 05/05/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit

class BorderButton: UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
    }
    
}
