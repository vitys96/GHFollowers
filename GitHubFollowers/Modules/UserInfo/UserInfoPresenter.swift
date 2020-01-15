//
//  UserInfoPresenter.swift
//  GitHubFollowers
//
//  Created TOOK on 15.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//
//  Template generated by Sakhabaev Egor @Banck
//  https://github.com/Banck/Swift-viper-template-for-xcode
//

import UIKit

class UserInfoPresenter {
    // MARK: - Properties
    weak private var view: UserInfoView?
    var interactor: UserInfoInteractorInput?
    private let router: UserInfoWireframeInterface
    var name: String!

    // MARK: - Initialization and deinitialization -
    init(interface: UserInfoView, interactor: UserInfoInteractorInput?, router: UserInfoWireframeInterface, name: String) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.name = name
    }


}

// MARK: - UserInfoPresenterInterface -
extension UserInfoPresenter: UserInfoPresenterInterface {
    func viewDidLoad() {
        self.view?.display(name)
        self.interactor?.fetchData(userName: name)
    }
}

// MARK: - UserInfoInteractorOutput -
extension UserInfoPresenter: UserInfoInteractorOutput {
    func fetchedUserInfo(userInfo: User) {
        self.view?.display(userInfo)
    }
    
    func fetchedUserInfo(error: Error) {
        
    }
    
    func fetchedFully() {
        
    }
}

