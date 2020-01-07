//
//  RequestManager.swift
//  GitHubFollowers
//
//  Created by TOOK on 07.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//

import Foundation
import Alamofire

class RequestManager: SessionManager {
    static var standard = RequestManager(timeout: 12, retrier: Retrier())
    static var stakes = RequestManager(timeout: nil, retrier: nil)

    init(timeout: TimeInterval?, retrier: Retrier?) {
        let configuration = URLSessionConfiguration.default
        if timeout != nil {
            configuration.timeoutIntervalForRequest = timeout!
        }
        super.init(configuration: configuration)
        self.retrier = retrier
    }
}


class Retrier: RequestRetrier {
    public func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: RequestRetryCompletion) {
        let maxRetryCount: Int = 5
        completion(request.retryCount < maxRetryCount, 1.0)
    }
}
