//
//  MainVC.swift
//  WindowShopper
//
//  Created by Gustavo Mac Mini on 06/05/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var wageTxt: CurrencyTextField!
    @IBOutlet weak var priceTxt: CurrencyTextField!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var hoursLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcBtn.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.4830131821, blue: 0.2324521631, alpha: 1)
        calcBtn.setTitle("Calculate", for: .normal)
        calcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calcBtn.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        
        wageTxt.inputAccessoryView = calcBtn
        priceTxt.inputAccessoryView = calcBtn
    }

    @objc func calculate() {
        if let wageVal = wageTxt.text, let priceVal = priceTxt.text, let wage = Double(wageVal.replacingOccurrences(of: ",", with: ".")), let price = Double(priceVal.replacingOccurrences(of: ",", with: ".")) {
            view.endEditing(true)
            resultLbl.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
            resultLbl.isHidden = false
            hoursLbl.isHidden = false
        }
    }
    
    @IBAction func onClearPressed(_ sender: Any) {
        wageTxt.text = ""
        priceTxt.text = ""
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
    }
}

