//
//  Item.swift
//  Todoey
//
//  Created by Gustavo Mac Mini on 23/04/19.
//  Copyright © 2019 DEVX. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
