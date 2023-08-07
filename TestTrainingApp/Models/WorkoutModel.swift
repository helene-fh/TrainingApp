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
   // var instructors: [InstructorsModel]
    var slots: SlotsModel
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case duration = "duration"
       // case instructors = "instructors"
        case slots = "slots"
    }
}

struct WorkoutModel: Decodable, Identifiable, Equatable {
    static func == (lhs: WorkoutModel, rhs: WorkoutModel) -> Bool {
        return true
    }
    
    var id: Int
    var name: String
    var duration: DurationModel
    //var instructors: [InstructorsModel]
    var slots: SlotsModel
}

struct DurationModel: Decodable {
    var start: String
    var end: String
}

/*struct InstructorsModel: Decodable {
}*/

struct SlotsModel: Decodable {
    var leftToBook: Int
}
 
