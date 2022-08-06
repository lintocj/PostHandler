//
//  PostDataViewModel.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import Foundation

struct PostDataViewModel {

    enum SuccessDataHandler {
        case success([Posts])
        case error(String)
    }

    typealias CompletionHandler = (SuccessDataHandler) -> Void

    static func getPostData(completionHandler: @escaping CompletionHandler) {
        APIService.callService(urlString: Path().posts) { (response: [Posts]) in
            completionHandler(.success(response))
        } failure: { error in
            completionHandler(.error(error.localizedDescription))
        }
    }

    static func searchDataHandler(searchText: String?, orignalData: [Posts]?) -> [Posts]? {
        guard let orignalData = orignalData else {
            return nil
        }
        if let searchText = searchText, searchText != "" {
            return orignalData.filter { (postList) -> Bool in
                if let title = postList.title, let body = postList.body {
                    let finalSearch = title + body
                    return finalSearch.localizedCaseInsensitiveContains(searchText)
                }
                return false
            }
        } else {
            return orignalData
        }
    }
}
