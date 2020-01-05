//
//  LibraryProtocols.swift
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
enum LibraryNavigationOption {
    //    case firstModule
    //    case secondModule(someData)
}

protocol LibraryWireframeInterface: class {
    func navigate(to option: LibraryNavigationOption)
}

//MARK: Presenter -
protocol LibraryPresenterInterface: class {

    var interactor: LibraryInteractorInput? { get set }
    
    // MARK: - Lifecycle -
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()

}
extension LibraryPresenterInterface {
    func viewDidLoad() {/*leaves this empty*/}
    func viewWillAppear() {/*leaves this empty*/}
    func viewDidAppear() {/*leaves this empty*/}
    func viewWillDisappear() {/*leaves this empty*/}
    func viewDidDisappear() {/*leaves this empty*/}
}


//MARK: Interactor -
protocol LibraryInteractorOutput: class {

    /* Interactor -> Presenter */
}

protocol LibraryInteractorInput: class {

    var presenter: LibraryInteractorOutput?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol LibraryView: class {

    var presenter: LibraryPresenterInterface?  { get set }

    /* Presenter -> ViewController */
}
