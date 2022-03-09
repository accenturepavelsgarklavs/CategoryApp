//
//  HobbyViewController.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 09/03/2022.
//

import UIKit

final class HobbyViewController: UIViewController {

    private var hobbyViewModel: HobbyViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "view-background-color")
        setupNavigationBar()
    }
    
    func configure(hobbyViewModel: HobbyViewModel) {
        self.hobbyViewModel = hobbyViewModel
    }
}

private extension HobbyViewController {
    func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Fredoka", size: 24)!]
        navigationItem.title = "Hobby"
    }
}
