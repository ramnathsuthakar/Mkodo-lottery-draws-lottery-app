//
//  Request.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import Foundation

enum Method: String {
    case get = "GET"
}

struct Request<Value> {
    
    var method: Method
    var path: String
    
    init(method: Method = .get, path: String) {
        self.method = method
        self.path = path
    }
}

