//
//  CategoryCell.swift
//  CoderSwag
//
//  Created by Gustavo Mac Mini on 06/05/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    func updateViews(category: Category) {
        categoryImage.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title
    }

}
