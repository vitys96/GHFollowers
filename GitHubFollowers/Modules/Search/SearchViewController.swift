//
//  SearchViewController.swift
//  GitHubFollowers
//
//  Created TOOK on 05.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//
//  Template generated by Sakhabaev Egor @Banck
//  https://github.com/Banck/Swift-viper-template-for-xcode
//

import UIKit

class SearchViewController: UIViewController {
    // MARK: - Properties
    var presenter: SearchPresenterInterface?
    private let logoImageView = UIImageView()
    private let usernameTextField = PrettyTextField()
    private let actionButton = PrettyButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    // MARK: - Lifecycle -
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        usernameTextField.text = "SAllen0400"
        //SAllen0400
        //ivanvorobei
    }
    
}

// MARK: - SearchView
extension SearchViewController: SearchView {
    
}

// MARK: - UI Config
extension SearchViewController {
    private func configureUI() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(logoImageView)

        logoImageView.image = UIImage(named: "gh-logo")!
        logoImageView.anchor(view.safeAreaLayoutGuide.topAnchor, topConstant: 80, widthConstant: 200, heightConstant: 200)
        logoImageView.anchorCenterXToSuperview()
        configureTextField()
        configureActionButton()
    }
    
    private func configureTextField() {
        usernameTextField.delegate = self
        self.view.addSubview(usernameTextField)
        usernameTextField.anchor(logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, topConstant: 48, leftConstant: 50, rightConstant: 50, heightConstant: 50)
    }
    
    private func configureActionButton() {
        self.view.addSubview(actionButton)
        actionButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, leftConstant: 50, bottomConstant: 50, rightConstant: 50, heightConstant: 50)
        actionButton.addTarget(self, action: #selector(pushFetchFollowersList), for: .touchUpInside)
    }
}

// MARK: - Objc Methods
extension SearchViewController {
    @objc private func pushFetchFollowersList() {
        guard let text = usernameTextField.text else { return }
        if !text.isEmpty {
//            AlertManager.showBonusAlert(data: CustomAlert.Data.init(title: "Вам подарок!", detail: "Как только вы пополните\r\nбаланс на 1000₽\r\nБонус будет зачислен на ваш счет"))
            self.presenter?.navigateToFollowList(title: text)
        } else {
            usernameTextField.shake()
        }
    }
}

// MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFetchFollowersList()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (string == " ") {
            return false
        }
        return true
    }
}
