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
    
    private var subCategoryModel: SubcategoryModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupSubCategory(model: SubcategoryModel) {
        subCategoryModel = model
        subcategory.setSubcategoryInfo(subcategoryModel: model)
        subcategory.configure()
        contentView.addSubview(subcategory)
        
        subcategory.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
