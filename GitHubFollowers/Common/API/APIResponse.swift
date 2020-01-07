//
//  APIResponse.swift
//  GitHubFollowers
//
//  Created by TOOK on 06.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//

import Foundation

enum APIResponse {
    case Success (response: [String : Any])
    case Error (code: Int?, message: String?)
}

enum APIDataResponse {
    case Success (response: Data)
    case Error (code: Int?, message: String?)
}

enum APIArrayResponse {
    case Success (response: [[String: Any]])
    case Error (code: Int?, message: String?)
}

typealias ServerResult      = (_ response: APIResponse) -> Void
typealias ServerArrayResult = (_ response: APIArrayResponse) -> Void
typealias ServerDataResult  = (_ response: APIDataResponse) -> Void

enum ResponseError: Error {
    case with(code: Int?, message: String?)
    case appError(error: AppError)
}

enum AppError: Error {
    case unknown
    
    var message: String {
        switch self {
        case .unknown:
            return "Unknown"
        }
    }
}
