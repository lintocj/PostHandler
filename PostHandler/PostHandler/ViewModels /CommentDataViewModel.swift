//
//  CommentDataViewModel.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import Foundation

struct CommentDataViewModel {

    enum SuccessDataHandler {
        case success([Comments])
        case error(String)
    }

    typealias CompletionHandler = (SuccessDataHandler) -> Void

    static func getCommentData(postId: String, completionHandler: @escaping CompletionHandler) {
        guard let url = CommentDataViewModel.queryString(Path().comments, params: ["postId": postId]) else {
            return
        }
        print(url)
        APIService.callService(urlString: url) { (response: [Comments]) in
            completionHandler(.success(response))
        } failure: { error in
            completionHandler(.error(error.localizedDescription))
        }
    }

    static func queryString(_ value: String, params: [String: String]) -> String? {
        var components = URLComponents(string: value)
        components?.queryItems = params.map { element in URLQueryItem(name: element.key, value: element.value) }

        return components?.url?.absoluteString
    }

    static func searchDataHandler(searchText: String?, orignalData: [Comments]?) -> [Comments]? {
        guard let orignalData = orignalData else {
            return nil
        }
        if let searchText = searchText, searchText != "" {
            return orignalData.filter { (postList) -> Bool in
                if let name = postList.name, let emailId = postList.email, let body = postList.body {
                    let final = name + emailId + body
                    return final.localizedCaseInsensitiveContains(searchText)
                }
                return false
            }
        } else {
            return orignalData
        }
    }
}
