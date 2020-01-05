//
//  MainTabBarController.swift
//  GitHubFollowers
//
//  Created by TOOK on 05.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//

import UIKit
class MainTabBarController: UITabBarController {
    
    private var minimizedTopAnchorConstraint: NSLayoutConstraint!
    private var maximizedTopAnchorConstraint: NSLayoutConstraint!
    private var bottomAnchorConstraint: NSLayoutConstraint!
    
    let searchVC: SearchViewController = SearchConfigurator.createModule() as! SearchViewController
    let favouriteVC: FavouritesViewController = FavouritesConfigurator.createModule() as! FavouritesViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        viewControllers = [
            generateViewControllers(rootVC: searchVC, image: UIImage(systemName: "magnifyingglass") ?? UIImage(), title: "Search"),
            generateViewControllers(rootVC: favouriteVC, image: UIImage(systemName: "magnifyingglass") ?? UIImage(), title: "Favourite")
        ]
        
    }
    
    private func generateViewControllers(rootVC: UIViewController, image: UIImage, title: String) -> UIViewController {
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.tabBarItem.image = image
        navVC.tabBarItem.title = title
        rootVC.navigationItem.title = title
        navVC.navigationBar.prefersLargeTitles = true
        return navVC
    }
    
}
