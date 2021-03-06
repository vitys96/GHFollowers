//
//  FollowerListConfigurator.swift
//  GitHubFollowers
//
//  Created TOOK on 06.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//
//  Template generated by Sakhabaev Egor @Banck
//  https://github.com/Banck/Swift-viper-template-for-xcode
//

import UIKit

struct FollowerListConfigurator {

	static func createModule(title: String) -> UIViewController {
        var view: FollowerListViewController!

        let viewController = UIStoryboard.init(name: "FollowerList", bundle: Bundle.main).instantiateInitialViewController()
        if viewController == nil {
            fatalError("Seems there is no initial view controller in FollowerList.storyboard")
        }

        if viewController is UINavigationController {
            view = (viewController as? UINavigationController)?.viewControllers.first as? FollowerListViewController
        } else {
            view = viewController as? FollowerListViewController
        }

        let interactor = FollowerListInteractor()
        let router = FollowerListRouter()
        let presenter = FollowerListPresenter(interface: view, interactor: interactor, router: router, title: title)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return viewController!
    }
}
