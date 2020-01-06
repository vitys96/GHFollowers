//
//  SearchProtocols.swift
//  GitHubFollowers
//
//  Created TOOK on 05.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//
//  Template generated by Sakhabaev Egor @Banck
//  https://github.com/Banck/Swift-viper-template-for-xcode
//

import Foundation

//MARK: Wireframe -
enum SearchNavigationOption {
    case secondModule(title: String)
}

protocol SearchWireframeInterface: class {
    func navigate(to option: SearchNavigationOption)
}

//MARK: Presenter -
protocol SearchPresenterInterface: class {

    var interactor: SearchInteractorInput? { get set }
    func navigateToFollowList(title: String)
    
    // MARK: - Lifecycle -
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()

}
extension SearchPresenterInterface {
    func viewDidLoad() {/*leaves this empty*/}
    func viewWillAppear() {/*leaves this empty*/}
    func viewDidAppear() {/*leaves this empty*/}
    func viewWillDisappear() {/*leaves this empty*/}
    func viewDidDisappear() {/*leaves this empty*/}
}


//MARK: Interactor -
protocol SearchInteractorOutput: class {

    /* Interactor -> Presenter */
}

protocol SearchInteractorInput: class {

    var presenter: SearchInteractorOutput?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol SearchView: class {

    var presenter: SearchPresenterInterface?  { get set }

    /* Presenter -> ViewController */
}
