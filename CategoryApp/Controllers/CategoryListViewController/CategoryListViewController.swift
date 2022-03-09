//
//  CategoryListViewController.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 09/03/2022.
//

import UIKit
import SnapKit
import CLTypingLabel

final class CategoryListViewController: UIViewController {
    
    private var categoryListViewModel: CategoryListViewModel?
    
    private let titleLabel = CLTypingLabel()
    private let workButton = UIButton()
    private let hobbyButton = UIButton()
    private let lifeButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "view-background-color")
        setupNavigationBar()
        setupTitleLabel()
        setupWorkButton()
        setupHobbyButton()
        setupLifeButton()
    }
    
    func configure(categoryListViewModel: CategoryListViewModel) {
        self.categoryListViewModel = categoryListViewModel
    }
}

private extension CategoryListViewController {
    func setupNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .black
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    func setupWorkButton() {
        view.addSubview(workButton)
        
        workButton.setTitle("Work", for: .normal)
        configureButton(button: workButton)

        
        workButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(60)
            make.leading.equalToSuperview().offset(70)
            make.trailing.equalToSuperview().inset(70)
        }
        
        workButton.addTarget(self, action: #selector(didTapWorkButton), for: .touchUpInside)
    }
    
    func setupHobbyButton() {
        view.addSubview(hobbyButton)
        
        hobbyButton.setTitle("Hobby", for: .normal)
        configureButton(button: hobbyButton)
        
        hobbyButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(workButton.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(70)
            make.trailing.equalToSuperview().inset(70)
        }
        
        hobbyButton.addTarget(self, action: #selector(didTapHobbyButton), for: .touchUpInside)
    }
    
    func setupLifeButton() {
        view.addSubview(lifeButton)
        
        lifeButton.setTitle("Life", for: .normal)
        configureButton(button: lifeButton)
        
        lifeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(hobbyButton.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(70)
            make.trailing.equalToSuperview().inset(70)
        }
        
        lifeButton.addTarget(self, action: #selector(didTapLifeButton), for: .touchUpInside)
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.text = "Categories"
        titleLabel.font = UIFont(name: "Fredoka", size: 64)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
        }
    }
    
    func configureButton(button: UIButton) {
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Fredoka", size: 48)
        button.backgroundColor = UIColor(named: "button-background-color")
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
    }
    
    @objc func didTapWorkButton() {
        categoryListViewModel?.onWorkButton?()
    }
    
    @objc func didTapHobbyButton() {
        categoryListViewModel?.onHobbyButton?()
    }
    
    @objc func didTapLifeButton() {
        categoryListViewModel?.onLifeButton?()
    }
}
