//
//  CategoryCell.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 11/03/2022.
//

import UIKit

final class CategoryCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CategoryCell"
    
    private let subcategory = BaseSubcategoryView()
    
    func setupSubCategory(model: SubcategoryModel) {
        subcategory.setSubcategoryInfo(subcategoryModel: model)
        subcategory.configure()
        contentView.addSubview(subcategory)
        
        subcategory.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
