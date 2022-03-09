//
//  LifeViewController.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 09/03/2022.
//

import UIKit

final class LifeViewController: UIViewController {
    
    private var lifeViewModel: LifeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "view-background-color")
        setupNavigationBar()
    }

    func configure(lifeViewModel: LifeViewModel) {
        self.lifeViewModel = lifeViewModel
    }
}

private extension LifeViewController {
    func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Fredoka", size: 24)!]
        navigationItem.title = "Life"
    }
}
