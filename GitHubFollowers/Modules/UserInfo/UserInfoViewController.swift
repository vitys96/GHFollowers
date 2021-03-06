//
//  UserInfoViewController.swift
//  GitHubFollowers
//
//  Created TOOK on 15.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//
//  Template generated by Sakhabaev Egor @Banck
//  https://github.com/Banck/Swift-viper-template-for-xcode
//

import UIKit

class UserInfoViewController: UIViewController {
    // MARK: - Properties
    var presenter: UserInfoPresenterInterface?
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        presenter?.viewDidLoad()
    }
    
}

// MARK: - UserInfoView
extension UserInfoViewController: UserInfoView {
    func display(_ navigationTitle: String) {
        self.navigationItem.title = navigationTitle
    }
    
    func display(_ userInfo: User) {
    }
    
    
}

// MARK: - ConfigureUI
extension UserInfoViewController {
    private func configureUI() {
        self.view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVc))
        navigationItem.rightBarButtonItem = doneButton
    }
}

// MARK: - Objc Functions
extension UserInfoViewController {
    @objc func dismissVc() {
        dismiss(animated: true)
    }
}
