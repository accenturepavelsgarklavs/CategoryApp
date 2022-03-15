//
//  SeeAllViewController.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 14/03/2022.
//

import UIKit

final class SeeAllViewController: UIViewController {
    
    private let backgroundView = UIView()
    
    private var collectionView: UICollectionView?
    private var seeAllViewModel: SeeAllViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "view-background-color")
        setupNavigationBar()
        setupBackgroundView()
        setupCollectionView()
    }
    
    func configure(seeAllViewModel: SeeAllViewModel) {
        self.seeAllViewModel = seeAllViewModel
    }
}

private extension SeeAllViewController {
    func setupNavigationBar() {
        guard let index = seeAllViewModel?.index else { return }
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Fredoka", size: 24)!]
        navigationItem.title = seeAllViewModel?.taskManager[index].subcategoryName
    }
    
    func setupBackgroundView() {
        view.addSubview(backgroundView)
        
        backgroundView.snp.makeConstraints { make in
            make.width.equalTo(290)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView?.register(SubcategoryCell.self, forCellWithReuseIdentifier: SubcategoryCell.reuseIdentifier)
        
        if let collectionView = collectionView {
            backgroundView.addSubview(collectionView)
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.backgroundColor = .clear
            collectionView.showsVerticalScrollIndicator = false
            
            collectionView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
}

extension SeeAllViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let index = seeAllViewModel?.index, let task = seeAllViewModel?.taskManager else { return .init() }
        return task[index].main.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubcategoryCell.reuseIdentifier, for: indexPath) as? SubcategoryCell, let index = seeAllViewModel?.index, let task = seeAllViewModel?.taskManager else { return .init() }
     
        let model = task[index].main[indexPath.row]
        
        cell.setCellInfo(model: model)
        
        return cell
    }
    
}

extension SeeAllViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 140)
    }
}
    
