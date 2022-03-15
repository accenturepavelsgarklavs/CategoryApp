//
//  BaseSubcategoryView.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 10/03/2022.
//

import UIKit

class BaseSubcategoryView: UIView {
    
    private var subcategoryCollectionView: SubcategoryCollectionView?
    private var subcategoryModel: SubcategoryModel?
    private var workViewModel: WorkViewModel?
    private var collectionIndex: Int?
    
    func configure() {
        setupSubcategoryCollectionView()
    }
    
    func setSubcategoryInfo(subcategoryModel: SubcategoryModel, workViewModel: WorkViewModel, index: Int) {
        self.subcategoryModel = subcategoryModel
        self.workViewModel = workViewModel
        self.collectionIndex = index
    }
    
}

private extension BaseSubcategoryView {
    func setupSubcategoryCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        subcategoryCollectionView = SubcategoryCollectionView(frame: .zero, collectionViewLayout: layout)
        
        subcategoryCollectionView?.delegate = self
        
        if let subcategoryCollectionView = subcategoryCollectionView, let subcategoryModel = subcategoryModel, let workViewModel = workViewModel, let collectionIndex = collectionIndex {
            subcategoryCollectionView.setSubcategoryInfo(subcategoryModel: subcategoryModel.main, workViewModel: workViewModel, collectionIndex: collectionIndex)
            subcategoryCollectionView.configure()
            self.addSubview(subcategoryCollectionView)
            
            subcategoryCollectionView.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(10)
                make.leading.trailing.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        }
    }
}

extension BaseSubcategoryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 140, height: 25)
    }
}
