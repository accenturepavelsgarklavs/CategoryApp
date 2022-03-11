//
//  WorkViewController.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 09/03/2022.
//

import UIKit

final class WorkViewController: UIViewController {
    
    private var workViewModel: WorkViewModel?
    
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "view-background-color")
        setupNavigationBar()
        setupCollectionView()
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
    
    func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 290, height: 325)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        
        if let collectionView = collectionView {
            view.addSubview(collectionView)
            collectionView.dataSource = self
            collectionView.backgroundColor = .clear
            
            collectionView.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
                make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
                make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            }
        }
    }
}

extension WorkViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell else { return .init() }
        
        cell.setupSubCategory(model: TaskManager.shared.data[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if TaskManager.shared.data.count > 4 {
            return 4
        } else {
            return TaskManager.shared.data.count
        }
    }
}
