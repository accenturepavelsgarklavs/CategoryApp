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
        guard let font = UIFont(name: "Fredoka", size: 24) else { return }
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .black
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font: font]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.title = "Work"
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        
        if let collectionView = collectionView {
            view.addSubview(collectionView)
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.backgroundColor = .clear
            collectionView.showsVerticalScrollIndicator = false
            
            collectionView.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
                make.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
                make.leading.equalToSuperview().offset(15)
                make.trailing.equalToSuperview().inset(15)
            }
        }
    }
}

extension WorkViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell, let workViewModel = workViewModel else { return .init() }
        
        cell.setupSubCategory(model: workViewModel.taskManager[indexPath.row], workViewModel: workViewModel, index: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let tasksCount = workViewModel?.taskManager.count else { return .init() }
        return tasksCount <= 4 ? tasksCount : 4
    }
}

extension WorkViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 290, height: 350)
    }
}
