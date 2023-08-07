//
//  DateFormatter.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-17.
//

import Foundation

extension Date{
    
    func convertTimestamp(timeStamp: String, isTime: Bool? = false, isDate: Bool? = false) -> String{
      
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "sv_SE")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
       
        var formattedDate = Date()
        var dateString = String()
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.timeZone = TimeZone(identifier: "UTC")
        
        if isTime == true{
            dateStringFormatter.dateFormat = "HH:mm"
            if let date = dateFormatter.date(from: timeStamp){
                   formattedDate = date
                   dateString = dateStringFormatter.string(from: formattedDate)
               }
        }
        
        if isDate == true{
            
            if let date = dateFormatter.date(from: timeStamp){
                formattedDate = date
                let calendar = Calendar.current
                if calendar.isDateInToday(formattedDate) {
                    dateString = Localize.today_label.string
                } else if calendar.isDateInTomorrow(formattedDate) {
                    dateString = Localize.tomorrow_label.string
                }else {
                    dateStringFormatter.dateFormat = "MMMM d"
                    dateString = dateStringFormatter.string(from: formattedDate)
                }
            }
        }

        return dateString
    }
}


