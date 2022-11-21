//
//  AppError.swift
//  InfoPlistFood
//
//  Created by сергей on 25.10.22.
//

import Foundation

enum AppErro: LocalizedError {
    case errorDecoding
    case unknowError
    case invalidUrl
    case serverError(String)

    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknowError:
            return "I habe no idea what go on"
        case .invalidUrl:
            return "Give me a valid Url"
        case .serverError(let error):
            return error
        }
    }
}
