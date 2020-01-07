//
//  MainAPI.swift
//  GitHubFollowers
//
//  Created by TOOK on 06.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//

import UIKit
import Alamofire

protocol MainAPI {
    static func sendRequest(type: HTTPMethod, url: String?, parameters: [String: AnyObject]?, headers: HTTPHeaders?, completion: ServerResult?)
}

extension MainAPI {
    static func sendRequest(type: HTTPMethod, url: String?, parameters: [String: AnyObject]?, headers: HTTPHeaders?,  completion: ServerResult?) {
        let urlString = url ?? ""
        let header: HTTPHeaders = headers == nil ? HTTPHeaders() : headers!
        Alamofire.request(urlString, method: type, parameters: parameters, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            guard let response = response.result.value as? [String : AnyObject] else {
                completion?(.Error(code: nil, message: nil))
                return
            }
            //            guard let data = response as? [String: Any] else {
            //                completion?(.Error(code: nil, message: nil))
            //                return
            //            }
            completion?(.Success(response: response))
        }
    }
    
//    static func sendRequest(type: HTTPMethod, url: String?, parameters: [String: AnyObject]?, headers: HTTPHeaders?, completion: ServerArrayResult?) {
//        let urlString = url ?? ""
//        var header: HTTPHeaders = headers == nil ? HTTPHeaders() : headers!
//
//        Alamofire.request(urlString, method: type, parameters: parameters).responseJSON { (response) in
//            print (response)
//            guard let response = response.result.value else {
//                completion?(.Error(code: nil, message: nil))
//                return
//            }
//            //            guard let data = response as? [String: Any] else {
//            //                completion?(.Error(code: nil, message: nil))
//            //                return
//            //            }
//            completion?(.Success(response: response))
//        }
//    }
    
    static func sendRequest(type: HTTPMethod, url: String?, parameters: [String: AnyObject]?, headers: HTTPHeaders?, completion: ServerArrayResult?) {
        let urlString = url ?? ""
        let header: HTTPHeaders = headers == nil ? HTTPHeaders() : headers!
        Alamofire.request(urlString, method: type, parameters: parameters, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            guard let response = response.result.value as? [[String : Any]] else { return }
            completion?( .Success (response: response))
        }
    }
}
