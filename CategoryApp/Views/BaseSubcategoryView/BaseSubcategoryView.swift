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
    
    private var viewModel = BaseSubcategoryViewModel()
    
    private let seeAllButton = UIButton()
    private let subcategoryTitleLabel = UILabel()
    
    func configure() {
        setupSubcategoryTitleLabel()
        setupSeeAllButton()
        setupSubcategoryCollectionView()
    }
    
    func setSubcategoryInfo(subcategoryModel: SubcategoryModel) {
        self.subcategoryModel = subcategoryModel
    }
    
}

private extension BaseSubcategoryView {
    func setupSubcategoryCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 140, height: 140)
        
        subcategoryCollectionView = SubcategoryCollectionView(frame: .zero, collectionViewLayout: layout)
        
        if let subcategoryCollectionView = subcategoryCollectionView, let subcategoryModel = subcategoryModel {
            subcategoryCollectionView.setSubcategoryInfo(subcategoryModel: subcategoryModel.main)
            subcategoryCollectionView.configure()
            self.addSubview(subcategoryCollectionView)
            
            subcategoryCollectionView.snp.makeConstraints { make in
                make.top.equalTo(subcategoryTitleLabel.snp.bottom).offset(10)
                make.leading.trailing.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        }
    }
    
    func setupSubcategoryTitleLabel() {
        self.addSubview(subcategoryTitleLabel)
        
        subcategoryTitleLabel.text = subcategoryModel?.subcategoryName
        subcategoryTitleLabel.font = UIFont(name: "Fredoka", size: 20)
        subcategoryTitleLabel.textColor = .black
        
        subcategoryTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    func setupSeeAllButton() {
        self.addSubview(seeAllButton)
        
        seeAllButton.setTitleColor(UIColor(named: "see-all-button-color"), for: .normal)
        seeAllButton.setTitleColor(.lightGray, for: .highlighted)
        seeAllButton.titleLabel?.font = UIFont(name: "Fredoka", size: 16)
        seeAllButton.backgroundColor = .clear
        seeAllButton.setAttributedTitle(addSFSymbolToText.makeText(text: "See All", symbol: "greaterthan.circle.fill", tintColor: UIColor(named: "see-all-button-color") ?? .black), for: .normal)
        
        seeAllButton.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.top.trailing.equalToSuperview()
        }
        
        seeAllButton.addTarget(self, action: #selector(didTapSeeAllButton), for: .touchUpInside)
    }
    
    @objc func didTapSeeAllButton() {
        viewModel.onSeeAllButton?()
        print("See all button tapped")
    }
}
