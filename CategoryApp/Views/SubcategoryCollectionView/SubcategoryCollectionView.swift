//
//  SubcategoryCollectionView.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 10/03/2022.
//

import UIKit

final class SubcategoryCollectionView: UICollectionView {
    
    private var subcategoryModel: [SubcategoryModel.Main]?
    private var workViewModel: WorkViewModel?
    private var collectionIndex: Int?

    func configure() {
        self.backgroundColor = UIColor(named: "view-background-color")
        setupCollection()
    }
    
    func setSubcategoryInfo(subcategoryModel: [SubcategoryModel.Main], workViewModel: WorkViewModel, collectionIndex: Int) {
        self.subcategoryModel = subcategoryModel
        self.workViewModel = workViewModel
        self.collectionIndex = collectionIndex
    }
}

private extension SubcategoryCollectionView {
    func setupCollection() {
        self.register(SubcategoryCell.self, forCellWithReuseIdentifier: SubcategoryCell.reuseIdentifier)
        self.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.reusableIdentifier)
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.reusableIdentifier, for: indexPath) as? HeaderCell, let workViewModel = workViewModel, let collectionIndex = collectionIndex else { return .init() }
            
            header.setWorkViewModel(workViewModel: workViewModel, index: collectionIndex)
            
            header.configure()
            return header
        default: return .init()
        }
    }
}
