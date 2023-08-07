//
//  ListItem.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-08-07.
//

import Foundation

struct ListItem {
    var section : String = ""
    var workouts : [WorkoutModel] = []
    
    init(section:String, workouts: [WorkoutModel]){
        self.section = section
        self.workouts = workouts
    }
}
