//
//  Environment.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import Foundation

enum Environment {
    case production

    func baseURL() -> String {
        return "\(urlProtocol())://\(domain()))"
    }

    func urlProtocol() -> String {
        switch self {
        case .production:
            return "https"
        }
    }

    func domain() -> String {
        switch self {
        case .production:
            return "jsonplaceholder.typicode.com"
        }
    }
}

extension Environment {
    func host() -> String {
        return "\(self.domain())"
    }
}

let baseUrl = Environment.production.baseURL()

struct Path {
    var posts: String { return "\(baseUrl)/posts" }
}
