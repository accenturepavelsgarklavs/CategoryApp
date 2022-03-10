//
//  SubcategoryCollectionView.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 10/03/2022.
//

import UIKit

class SubcategoryCollectionView: UICollectionView {
    
    private var subcategoryModel: SubcategoryModel?

    func configure() {
        self.backgroundColor = UIColor(named: "view-background-color")
        setupCollection()
    }
    
    func setSubcategoryInfo(subcategoryModel: SubcategoryModel) {
        self.subcategoryModel = subcategoryModel
    }
}

private extension SubcategoryCollectionView {
    func setupCollection() {
        self.register(SubcategoryCell.self, forCellWithReuseIdentifier: SubcategoryCell.reuseIdentifier)
        self.dataSource = self
        self.delegate = self
    }
}

extension SubcategoryCollectionView: UICollectionViewDelegate {
    
}

extension SubcategoryCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: SubcategoryCell.reuseIdentifier, for: indexPath) as? SubcategoryCell else { return .init() }
        
        guard let subcategoryModel = subcategoryModel else { return .init()}

        cell.setCellInfo(model: subcategoryModel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
}
