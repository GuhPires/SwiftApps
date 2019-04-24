//
//  Category.swift
//  Todoey
//
//  Created by Gustavo Mac Mini on 23/04/19.
//  Copyright © 2019 DEVX. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
