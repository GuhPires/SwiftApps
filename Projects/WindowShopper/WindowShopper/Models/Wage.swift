//
//  Wage.swift
//  WindowShopper
//
//  Created by Gustavo Mac Mini on 06/05/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import Foundation

class Wage {
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage))
    }
}
