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
        let categoryListViewModel = CategoryListViewModel()
        
        categoryListController.configure(categoryListViewModel: categoryListViewModel)

        categoryListViewModel.onWorkButton = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.pushViewController(self.makeWorkViewController(), animated: true)
        }
        
        categoryListViewModel.onHobbyButton = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.pushViewController(self.makeHobbyViewController(), animated: true)
        }
        
        categoryListViewModel.onLifeButton = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.pushViewController(self.makeLifeViewController(), animated: true)
        }
        
        return categoryListController
    }
    
    func makeWorkViewController() -> UIViewController {
        let workViewController = WorkViewController()
        let workViewModel = WorkViewModel()
        
        workViewModel.onSeeAllButton = { [weak self] index in
            guard let self = self else { return }
            self.navigationController?.pushViewController(self.makeSeeAllViewController(index: index), animated: true)
        }
        
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
    
    func makeSeeAllViewController(index: Int) -> UIViewController {
        let seeAllViewController = SeeAllViewController()
        let seeAllViewModel = SeeAllViewModel()
        
        seeAllViewController.setIndexOfModel(index: index)
        seeAllViewController.configure(seeAllViewModel: seeAllViewModel)
        
        return seeAllViewController
    }
}

