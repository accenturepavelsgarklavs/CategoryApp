//
//  SubcategoryCollectionView.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 10/03/2022.
//

import UIKit

final class SubcategoryCollectionView: UICollectionView {
    
    private var subcategoryModel: [SubcategoryModel.Main]?
    
    var selectedItem: Int?

    func configure() {
        self.backgroundColor = UIColor(named: "view-background-color")
        setupCollection()
    }
    
    func setSubcategoryInfo(subcategoryModel: [SubcategoryModel.Main]) {
        self.subcategoryModel = subcategoryModel
    }
}

private extension SubcategoryCollectionView {
    func setupCollection() {
        self.register(SubcategoryCell.self, forCellWithReuseIdentifier: SubcategoryCell.reuseIdentifier)
        self.dataSource = self
    }
}

extension SubcategoryCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: SubcategoryCell.reuseIdentifier, for: indexPath) as? SubcategoryCell, let subcategoryModel = subcategoryModel else { return .init() }
        
        cell.setCellInfo(model: subcategoryModel[indexPath.row])
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let count = subcategoryModel?.count else { return .init() }
        
        if count > 4 {
            return 4
        } else {
            return count
        }
    }
    
}
