//
//  Localize.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-17.
//

import Foundation

enum Localize: String {
    case places_remaining
    case upcoming_sessions
    case today_label
    case tomorrow_label
}

extension Localize {
    var string: String {
        return NSLocalizedString(rawValue, comment: "")
    }
}
