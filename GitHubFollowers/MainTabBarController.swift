//
//  MainTabBarController.swift
//  GitHubFollowers
//
//  Created by TOOK on 05.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//

import UIKit
class MainTabBarController: UITabBarController {

    let searchVC: SearchViewController = SearchConfigurator.createModule() as! SearchViewController
    let favouriteVC: FavouritesViewController = FavouritesConfigurator.createModule() as! FavouritesViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tabBar.tintColor = .systemGreen
        
        viewControllers = [
            generateViewControllers(rootVC: SearchConfigurator.createModule(), tabBarItem: .search, tag: 0, title: "Search"),
            generateViewControllers(rootVC: FavouritesConfigurator.createModule(), tabBarItem: .favorites, tag: 1, title: "Favourite")
        ]
        
    }
    
    private func generateViewControllers(rootVC: UIViewController, tabBarItem: UITabBarItem.SystemItem, tag: Int, title: String) -> UIViewController {
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.tabBarItem = UITabBarItem(tabBarSystemItem: tabBarItem, tag: tag)
        navVC.tabBarItem.title = title
        rootVC.navigationItem.title = title
        navVC.navigationBar.prefersLargeTitles = false
        return navVC
    }
    
}
