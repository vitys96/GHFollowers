//
//  GetFollowersAPI.swift
//  GitHubFollowers
//
//  Created by TOOK on 06.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//

import Foundation

struct GetFollowersAPI: MainAPI {
    static func getFollowers(userName: String, completion: ServerArrayResult?)  {
//        let params = [
//            "term"      :   searchText,
//            "limit"     :   OffsetConfig.limit,
//            "media"     :   "music",
//            "offset"    :   OffsetConfig.offset
//            ] as [String : AnyObject]
        let baseUrl = "https://api.github.com"
        let url = baseUrl + "/users/\(userName)/followers?per_page=60&page=1"
        print (url)
        sendRequest(type: .get, url: url, parameters: nil, headers: nil, completion: completion)
    }
}
