//
//  ProductsVC.swift
//  CoderSwag
//
//  Created by Gustavo Mac Mini on 07/05/20.
//  Copyright © 2020 DEVX. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController {
    
    @IBOutlet weak var productsCollection: UICollectionView!
    
    private(set) public var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productsCollection.dataSource = self
        productsCollection.delegate = self
    }
    
    func initProducts(category: Category) {
        products = DataService.instance.getProducts(forCategoryTitle: category.title)
        navigationItem.title = category.title
    }
}

// MARK: - Collection View Methods
extension ProductsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
            cell.updateViews(product: products[indexPath.item])
            return cell
        } else {
            return ProductCell()
        }
    }
    
    
}
