//
//  UserInfoProtocols.swift
//  GitHubFollowers
//
//  Created TOOK on 15.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//
//  Template generated by Sakhabaev Egor @Banck
//  https://github.com/Banck/Swift-viper-template-for-xcode
//

import Foundation

//MARK: Wireframe -
enum UserInfoNavigationOption {
    //    case firstModule
    //    case secondModule(someData)
}

protocol UserInfoWireframeInterface: class {
    func navigate(to option: UserInfoNavigationOption)
}

//MARK: Presenter -
protocol UserInfoPresenterInterface: class {

    var interactor: UserInfoInteractorInput? { get set }
    
    // MARK: - Lifecycle -
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()

}
extension UserInfoPresenterInterface {
    func viewDidLoad() {/*leaves this empty*/}
    func viewWillAppear() {/*leaves this empty*/}
    func viewDidAppear() {/*leaves this empty*/}
    func viewWillDisappear() {/*leaves this empty*/}
    func viewDidDisappear() {/*leaves this empty*/}
}


//MARK: Interactor -
protocol UserInfoInteractorOutput: class {

    /* Interactor -> Presenter */
}

protocol UserInfoInteractorInput: class {

    var presenter: UserInfoInteractorOutput?  { get set }
    func fetchData(userName: String)
    /* Presenter -> Interactor */
}

//MARK: View -
protocol UserInfoView: class {

    var presenter: UserInfoPresenterInterface?  { get set }

    /* Presenter -> ViewController */
}
