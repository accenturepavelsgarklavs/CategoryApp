//
//  WorkViewController.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 09/03/2022.
//

import UIKit

final class WorkViewController: UIViewController {
    
    private var workViewModel: WorkViewModel?
    
    private let subcategoryViewOne = BaseSubcategoryView()
    private let subcategoryViewTwo = BaseSubcategoryView()
    
    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "view-background-color")
        setupNavigationBar()
        setupScrollView()
        setupSubcategoryViewOne()
        setupSubcategoryViewTwo()
    }
    
    func configure(workViewModel: WorkViewModel) {
        self.workViewModel = workViewModel
    }
}

private extension WorkViewController {
    func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Fredoka", size: 24)!]
        navigationItem.title = "Work"
    }
    
    func setupSubcategoryViewOne() {
        scrollView.addSubview(subcategoryViewOne)
        
        let subcategoryViewOneModel = SubcategoryModel(subcategoryName: "Sub Category 1", subcategoryDescription: "We need to test it.", subcategoryImage: "cell-background-image")
        subcategoryViewOne.setSubcategoryInfo(subcategoryModel: subcategoryViewOneModel)
        
        subcategoryViewOne.configure()
        
        subcategoryViewOne.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.centerX.equalToSuperview()
            make.width.equalTo(290)
            make.height.equalTo(325)
        }
    }
    
    func setupSubcategoryViewTwo() {
        scrollView.addSubview(subcategoryViewTwo)
        
        let subcategoryViewTwoModel = SubcategoryModel(subcategoryName: "Sub Category 2", subcategoryDescription: "We need to test it second time.", subcategoryImage: "cell-background-image")
        subcategoryViewTwo.setSubcategoryInfo(subcategoryModel: subcategoryViewTwoModel)
        subcategoryViewTwo.configure()
        
        subcategoryViewTwo.snp.makeConstraints { make in
            make.top.equalTo(subcategoryViewOne.snp.bottom).offset(30)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(290)
            make.height.equalTo(325)
        }
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
