//
//  AppDelegate.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 09/03/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        navigationController = UINavigationController(rootViewController: makeCategoryListController())

        window?.rootViewController = navigationController
        return true
    }
}

private extension AppDelegate {
    func makeCategoryListController() -> UIViewController {
        let categoryListController = CategoryListViewController()
        let categoryListViweModel = CategoryListViewModel()
        
        categoryListController.configure(categoryListViewModel: categoryListViweModel)

        categoryListViweModel.onWorkButton = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.pushViewController(self.makeWorkViewController(), animated: true)
        }
        
        categoryListViweModel.onHobbyButton = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.pushViewController(self.makeHobbyViewController(), animated: true)
        }
        
        categoryListViweModel.onLifeButton = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.pushViewController(self.makeLifeViewController(), animated: true)
        }
        
        return categoryListController
    }
    
    func makeWorkViewController() -> UIViewController {
        let workViewController = WorkViewController()
        let workViewModel = WorkViewModel()
        
        workViewController.configure(workViewModel: workViewModel)
        
        return workViewController
    }
    
    func makeHobbyViewController() -> UIViewController {
        let hobbyViewController = HobbyViewController()
        let hobbyViewModel = HobbyViewModel()
        
        hobbyViewController.configure(hobbyViewModel: hobbyViewModel)
        
        return hobbyViewController
    }
    
    func makeLifeViewController() -> UIViewController {
        let lifeViewController = LifeViewController()
        let lifeViewModel = LifeViewModel()
        
        lifeViewController.configure(lifeViewModel: lifeViewModel)
        
        return lifeViewController
    }
}

