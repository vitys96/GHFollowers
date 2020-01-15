//
//  GetUserInfo.swift
//  GitHubFollowers
//
//  Created by TOOK on 15.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//

import Foundation

struct GetUserInfo: MainAPI {
    static func getUserInfo(userName: String, completion: ServerResult?)  {
        let baseUrl = "https://api.github.com/users/"
        let url = baseUrl + "\(userName)"
        print (url)
        sendRequest(type: .get, url: url, parameters: nil, headers: nil, completion: completion)
    }
}
