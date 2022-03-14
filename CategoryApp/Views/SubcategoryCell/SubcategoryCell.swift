//
//  SubcategoryCell.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 09/03/2022.
//

import UIKit

final class SubcategoryCell: UICollectionViewCell {

    static let reuseIdentifier = "SubcategoryCell"
    
    private let cellDescriptionLabel = UILabel()
    
    private var background: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()
    }
    
    func setCellInfo(model: SubcategoryModel.Main) {
        cellDescriptionLabel.text = model.subcategoryDescription
        background = UIImage(named: model.subcategoryImage)
    }
}

private extension SubcategoryCell {
    func setupCell() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        
        assignbackground()
        setupCellDescriptionLabel()
    }
    
    func setupCellDescriptionLabel() {
        contentView.addSubview(cellDescriptionLabel)
        
        cellDescriptionLabel.textAlignment = .left
        cellDescriptionLabel.numberOfLines = 5
        cellDescriptionLabel.textColor = .white
        cellDescriptionLabel.font = UIFont(name: "Fredoka", size: 14)
        
        cellDescriptionLabel.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.bottom.equalToSuperview().inset(5)
            make.leading.equalToSuperview().offset(5)
        }
    }
    
    func assignbackground(){
        var imageView = UIImageView()
        imageView = UIImageView(frame: contentView.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = contentView.center
        contentView.addSubview(imageView)
        contentView.sendSubviewToBack(imageView)
    }
}
