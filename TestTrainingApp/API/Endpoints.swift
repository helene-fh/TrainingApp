//
//  Endpoints.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-22.
//

import Foundation

enum Endpoints: String {
    case workouts
    
    var endPoint: String {
        return workoutsDateRange()
    }
    
    private func workoutsDateRange() -> String{
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
         let calendar = Calendar.current
         let startDate = Date()
         let endDate = calendar.date(byAdding: .day, value: 6, to: startDate)

         let htmlEncodedStartDate = dateFormatter.string(from: startDate).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
         let htmlEncodedEndDate = dateFormatter.string(from: endDate!).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
         
         let workoutsEndpoint = "/groupactivities" + "?period.start=\(htmlEncodedStartDate)&period.end=\(htmlEncodedEndDate)"
         print("THE URL \(workoutsEndpoint)")
        
        return workoutsEndpoint
    }
}
