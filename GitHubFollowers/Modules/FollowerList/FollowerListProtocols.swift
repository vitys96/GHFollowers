//
//  FollowerListProtocols.swift
//  GitHubFollowers
//
//  Created TOOK on 06.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//
//  Template generated by Sakhabaev Egor @Banck
//  https://github.com/Banck/Swift-viper-template-for-xcode
//

import Foundation

//MARK: Wireframe -
enum FollowerListNavigationOption {
    case searchModule
    case userInfo(name: String)
}

protocol FollowerListWireframeInterface: class {
    func navigate(to option: FollowerListNavigationOption)
}

//MARK: Presenter -
protocol FollowerListPresenterInterface: class {

    var interactor: FollowerListInteractorInput? { get set }
    func fetchData()
    func didSelectFollowerCell(followerName: String)
    
    // MARK: - Lifecycle -
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()

}
extension FollowerListPresenterInterface {
    func viewDidLoad() {/*leaves this empty*/}
    func viewWillAppear() {/*leaves this empty*/}
    func viewDidAppear() {/*leaves this empty*/}
    func viewWillDisappear() {/*leaves this empty*/}
    func viewDidDisappear() {/*leaves this empty*/}
}


//MARK: Interactor -
protocol FollowerListInteractorOutput: class {
    func fetchedFollowersList(lists: [Follower])
    func fetchedFollowersList(error: Error)
    func fetchedFully()
    
    /* Interactor -> Presenter */
}

protocol FollowerListInteractorInput: class {

    var presenter: FollowerListInteractorOutput?  { get set }
    func fetchData(userName: String)

    /* Presenter -> Interactor */
}

//MARK: View -
protocol FollowerListView: class, Loadable {

    var presenter: FollowerListPresenterInterface?  { get set }
    func display(_ followersList: [FollowerCell.Data])
    /* Presenter -> ViewController */
}
