//
//  User.swift
//  GitHubFollowers
//
//  Created by TOOK on 06.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//

import Foundation
import Marshal

class User: Unmarshaling {
    
    var login: String?
    var avatarUrl: String?
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int?
    var publicGists: Int?
    var htmlUrl: String?
    var following: Int?
    var followers: Int?
    var createdAt: String?
    

    required init(object json: MarshaledObject) {
        login = try? json.value(for: "login")
        avatarUrl = try? json.value(for: "avatar_url")
        name = try? json.value(for: "name")
        location = try? json.value(for: "location")
        bio = try? json.value(for: "bio")
        publicRepos = try? json.value(for: "public_repos")
        publicGists = try? json.value(for: "public_gists")
        htmlUrl = try? json.value(for: "url")
        following = try? json.value(for: "following")
        followers = try? json.value(for: "followers")
        createdAt = try? json.value(for: "created_at")
    }
}
