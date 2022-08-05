//
//  APIService.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

struct APIService {
    static func callService<T: Decodable>(urlString: String, httpMethod: HTTPMethod = .get, success:@escaping (T) -> Void, failure:@escaping (Error) -> Void) {
        guard let url = URL(string: urlString) else {
            failure(CustomError.emptyURL)
            return
        }
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let datatask: URLSessionDataTask = session.dataTask(with: request as URLRequest) { data, _, error in

            if let error = error {
                failure(error)
            }
            guard let data = data else {
                failure(CustomError.outPutDataNilOrZeroLength)
                return
            }
            let decoder = JSONDecoder()
            if let json = try? decoder.decode(T.self, from: data) {
                success(json)
            } else {
                failure(CustomError.jsonSerializationFailed)
            }

        }
        datatask.resume()
    }
}
