//
//  FollowerListRouter.swift
//  GitHubFollowers
//
//  Created TOOK on 06.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//
//  Template generated by Sakhabaev Egor @Banck
//  https://github.com/Banck/Swift-viper-template-for-xcode
//

import UIKit

class FollowerListRouter {
    // MARK: - Properties
    weak var viewController: UIViewController?
}

// MARK: - FollowerListWireframeInterface -
extension FollowerListRouter: FollowerListWireframeInterface {
    
    func navigate(to option: FollowerListNavigationOption) {
        var vc: UIViewController!
        switch option {
        case .searchModule:
            viewController?.navigationController?.popToRootViewController(animated: true)
        case .userInfo(let name):
            vc = UserInfoConfigurator.createModule(with: name)
        }
        if vc is UINavigationController {
            viewController?.present(vc, animated: true, completion: nil)
        } else {
            viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
