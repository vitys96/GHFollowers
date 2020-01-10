//
//  FollowersSearchManager.swift
//  GitHubFollowers
//
//  Created by TOOK on 06.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//

import UIKit
import PromiseKit
struct FollowersSearchManager {
    
    static func searchSongs(searchingText: String, page: Int) -> Promise<[Follower]> {
        return Promise { (resolver) in
            GetFollowersAPI.getFollowers(userName: searchingText, page: page) { (response) in
                switch response {
                case .Success(let data):
                    do {
                        let result = try data.map { try Follower(object: $0) }
                        resolver.fulfill(result)
                    } catch {
                        resolver.reject(ResponseError.with(code: nil, message: nil))
                    }
                case .Error(let code, let message):
                    resolver.reject(ResponseError.with(code: code, message: message))
                }
            }
        }
    }
}
