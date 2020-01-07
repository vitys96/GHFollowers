//
//  Follower.swift
//  GitHubFollowers
//
//  Created by TOOK on 06.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//

import Foundation
import Marshal

class Follower: Unmarshaling {
    
    var login: String?
    var avatarUrl: String?
    
    required init(object json: MarshaledObject) throws {
        login = try? json.value(for: "login")
        avatarUrl = try? json.value(for: "avatar_url")
    }
}
