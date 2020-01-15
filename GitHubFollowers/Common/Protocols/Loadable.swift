//
//  Loadable.swift
//  GitHubFollowers
//
//  Created by TOOK on 11.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//

import Foundation
protocol Loadable {
    func startLoading()
    func stopLoading()
    func showEmptyStateView(with message: String)
}
