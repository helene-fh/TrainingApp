//
//  Endpoints.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-22.
//

import Foundation

enum Endpoints: String {
    case clubs
    case workouts
    
    var endPoint: String {
        switch self {
        case .clubs:
            return ""
        case .workouts:
            let url = fetchWorkoutRange()
            return url
        }
    }
    
    private func fetchWorkoutRange() -> String{
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
         let calendar = Calendar.current
         let startDate = Date()
         let end = calendar.date(byAdding: .day, value: 6, to: startDate)

         let htmlEncodedStartDate = dateFormatter.string(from: startDate).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
         let htmlEncodedEndDate = dateFormatter.string(from: end!).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
         
         let theUrl = "/groupactivities" + "?period.start=\(htmlEncodedStartDate)&period.end=\(htmlEncodedEndDate)"
         print("THE URL \(theUrl)")
        
        return theUrl
    }
}
