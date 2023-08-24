//
//  NetworkErrors.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-18.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return Localize.invalidURL.string
        case .responseError:
            return Localize.responseError.string
        case .unknown:
            return Localize.unknown.string
        }
    }
}
