//
//  SearchRouter.swift
//  GitHubFollowers
//
//  Created TOOK on 05.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//
//  Template generated by Sakhabaev Egor @Banck
//  https://github.com/Banck/Swift-viper-template-for-xcode
//

import UIKit

class SearchRouter {
    // MARK: - Properties
    weak var viewController: UIViewController?
}

// MARK: - SearchWireframeInterface -
extension SearchRouter: SearchWireframeInterface {
    
    func navigate(to option: SearchNavigationOption) {
        let vc: UIViewController!
        switch option {
        case .secondModule(let title):
            vc = FollowerListConfigurator.createModule(title: title)
            vc.title = title
        }
        if vc is UINavigationController {
            viewController?.present(vc, animated: true, completion: nil)
        } else {
            viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
