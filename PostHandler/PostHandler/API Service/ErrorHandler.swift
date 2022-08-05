//
//  ErrorHandler.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import Foundation

public enum CustomError: Error {
    case emptyURL
    case outPutDataNilOrZeroLength
    case jsonSerializationFailed
    case genericError

}
// MARK: - Custom Error Description
extension CustomError: LocalizedError {
    public var failureReason: String? {
        switch self {
        case .emptyURL: return NSLocalizedString("Pass the URL data to start process", comment: "")
        case .outPutDataNilOrZeroLength: return NSLocalizedString("output data is nil", comment: "")
        case .jsonSerializationFailed: return NSLocalizedString("JSON serialization failed", comment: "")
        case .genericError: return NSLocalizedString("Something went wrong. Please try again later", comment: "")
        }
    }
}
