//
//  WorkoutModel.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-16.
//

import Foundation

struct WorkoutResponse: Decodable {
    var id: Int
    var name: String
    var duration: DurationModel
    var slots: SlotsModel
}

struct WorkoutModel: Decodable, Identifiable, Equatable {
    static func == (lhs: WorkoutModel, rhs: WorkoutModel) -> Bool {
        return true
    }
    
    var id: Int
    var name: String
    var duration: DurationModel
    var slots: SlotsModel
}

struct DurationModel: Decodable {
    var start: String
    var end: String
}

struct SlotsModel: Decodable {
    var leftToBook: Int
}
 
