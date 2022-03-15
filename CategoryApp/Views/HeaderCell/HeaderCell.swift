//
//  HeaderCell.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 14/03/2022.
//

import UIKit

final class HeaderCell: UICollectionViewCell {
    
    static let reusableIdentifier = "HeaderCell"
    
    private var workViewModel: WorkViewModel?
    private var index: Int?
    
    private let seeAllButton = UIButton()
    private let subcategoryTitleLabel = UILabel()
    
    func configure() {
        setupSeeAllButton()
        setupSubcategoryTitleLabel()
    }
    
    func setWorkViewModel(workViewModel: WorkViewModel, index: Int) {
        self.workViewModel = workViewModel
        self.index = index
    }
}

private extension HeaderCell {
    func setupSubcategoryTitleLabel() {
        self.addSubview(subcategoryTitleLabel)
        
        subcategoryTitleLabel.text = "Sub Category One"
        subcategoryTitleLabel.font = UIFont(name: "Fredoka", size: 20)
        subcategoryTitleLabel.textColor = .black
        
        subcategoryTitleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.leading.equalToSuperview()
        }
    }
    
    func setupSeeAllButton() {
        self.addSubview(seeAllButton)
        
        seeAllButton.setTitleColor(UIColor(named: "see-all-button-color"), for: .normal)
        seeAllButton.setTitleColor(.lightGray, for: .highlighted)
        seeAllButton.titleLabel?.font = UIFont(name: "Fredoka", size: 16)
        seeAllButton.backgroundColor = .clear
        seeAllButton.setAttributedTitle(AddSFSymbolToText.makeText(text: "See All", symbol: "greaterthan.circle.fill", tintColor: UIColor(named: "see-all-button-color") ?? .black), for: .normal)
        
        seeAllButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        seeAllButton.addTarget(self, action: #selector(didTapSeeAllButton), for: .touchUpInside)
    }
    
    @objc func didTapSeeAllButton() {
        guard let index = index else { return }
        workViewModel?.onSeeAllButton?(index)
    }
}
