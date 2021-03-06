//
//  FollowerListInteractor.swift
//  GitHubFollowers
//
//  Created TOOK on 06.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//
//  Template generated by Sakhabaev Egor @Banck
//  https://github.com/Banck/Swift-viper-template-for-xcode
//

import UIKit

class FollowerListInteractor: FollowerListInteractorInput {
    
    
    // MARK: - Properties
    weak var presenter: FollowerListInteractorOutput?
    private var page: Int = 0
    
    // MARK: - FollowerListInteractorInput -
    func fetchData(userName: String) {
        page += 1
        FollowersSearchManager.searchFollowers(searchingText: userName, page: page)
        .done {[weak self] (followersList) in
                self?.presenter?.fetchedFollowersList(lists: followersList)
        }.catch {[weak self] (error) in
            self?.presenter?.fetchedFollowersList(error: error)
        }
        .finally {[weak self] in
            self?.presenter?.fetchedFully()
        }
    }
}
