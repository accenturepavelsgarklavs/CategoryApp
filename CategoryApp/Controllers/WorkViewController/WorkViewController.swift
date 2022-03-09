//
//  WorkViewController.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 09/03/2022.
//

import UIKit

final class WorkViewController: UIViewController {
    
    private var workViewModel: WorkViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "view-background-color")
        setupNavigationBar()
        
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
}
