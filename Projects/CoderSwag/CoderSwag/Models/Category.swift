//
//  Category.swift
//  CoderSwag
//
//  Created by Gustavo Mac Mini on 06/05/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import Foundation

struct Category {
    private(set) public var title: String
    private(set) public var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
