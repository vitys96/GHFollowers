//
//  FollowerListPresenter.swift
//  GitHubFollowers
//
//  Created TOOK on 06.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//
//  Template generated by Sakhabaev Egor @Banck
//  https://github.com/Banck/Swift-viper-template-for-xcode
//

import UIKit

class FollowerListPresenter {
    // MARK: - Properties
    weak private var view: FollowerListView?
    var interactor: FollowerListInteractorInput?
    private let router: FollowerListWireframeInterface
    private var title: String

    // MARK: - Initialization and deinitialization -
    init(interface: FollowerListView, interactor: FollowerListInteractorInput?, router: FollowerListWireframeInterface, title: String) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.title = title
    }
    
    func viewWillAppear() {
        self.interactor?.fetchData(userName: title)
    }

}

// MARK: - FollowerListPresenterInterface -
extension FollowerListPresenter: FollowerListPresenterInterface {
    
}

// MARK: - FollowerListInteractorOutput -
extension FollowerListPresenter: FollowerListInteractorOutput {
    func fetchedFollowersList(lists: [Follower]) {
        let items: [FollowerCell.Data] = lists.map({FollowerCell.Data(imageUrl: $0.avatarUrl ?? "", userName: $0.login ?? "")})
        view?.display(items)
    }
    
    func fetchedFollowersList(error: Error) {
        
    }
    
    func fetchedFully() {
        
    }
    
    
}

