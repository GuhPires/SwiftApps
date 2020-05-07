//
//  CurrencyTextField.swift
//  WindowShopper
//
//  Created by Gustavo Mac Mini on 06/05/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit

class CurrencyTextField: UITextField {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        customizeView()
    }
    
    func customizeView() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.25)
        layer.cornerRadius = 5.0
        textAlignment = .center
        textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        if let plch = placeholder {
            attributedPlaceholder = NSAttributedString(string: plch, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        }
    }
    
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 40
        let currencyLbl = UILabel(frame: CGRect(x: 5, y: (frame.size.height / 2) - (size / 2), width: size, height: size))
        clipsToBounds = true
        currencyLbl.backgroundColor = #colorLiteral(red: 0.8801003886, green: 0.8801003886, blue: 0.8801003886, alpha: 0.2)
        currencyLbl.textAlignment = .center
        currencyLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        currencyLbl.layer.cornerRadius = 5.0
        currencyLbl.clipsToBounds = true
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        currencyLbl.text = formatter.currencySymbol
        
        addSubview(currencyLbl)
    }
}
