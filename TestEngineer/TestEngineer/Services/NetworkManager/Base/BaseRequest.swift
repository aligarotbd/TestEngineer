//
//  BaseRequest.swift
//  TestEngineer
//
//  Created by Dima Bondar on 10/22/18.
//  Copyright © 2018 Dima Bondar. All rights reserved.
//

import Foundation

 enum HTTPMethod: String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
}

class BaseRequest {
    static let serverURL = "https://hn.algolia.com/"
    static let apiVersion = "api/v1/"
    static let baseURL = URL(string: BaseRequest.serverURL)!
    
    var path: String = ""
    var method: HTTPMethod = .get
    var parameters: [String: String] = [:]
    var headers: [String: String] = [:]
    var data: Data?
    
     init() {
        path.append(BaseRequest.apiVersion)
    }
    
    func createRequest() -> URLRequest {
        var url = BaseRequest.baseURL
        url.appendPathComponent(path)
        
        let urlWithQueries = !parameters.isEmpty ? url.withQueries(parameters) ?? url : url
        
        var request = URLRequest(url: urlWithQueries)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = data
        
        return request
    }
}

