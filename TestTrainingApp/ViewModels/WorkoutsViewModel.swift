//
//  WorkoutsViewModel.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-16.
//

import UIKit
import Combine

class WorkoutsViewModel: NSObject {
    
    var dataManager : DataManager
    private let cancellables: [AnyCancellable] = []
    
    var workoutItems : [WorkoutModel] = []
    var listItems: [ListItem] = []
    var dateSections: [String] = []
    
    init(dataManager: DataManager){
        self.dataManager = dataManager
        super.init()
        var array : [ListItem] = []
        array = addWorkout(listItems: array)
        listItems = array
    }
    
    func addWorkout(listItems: [ListItem]) -> [ListItem]{
        var updatedList = listItems
        
        for workout in workoutItems {

            let dateString = formatDateFromTimestamp(workout.duration.start)

            if !dateSections.contains(dateString){
                dateSections.append(dateString)
            }
            
            if let index = updatedList.firstIndex(where: { $0.section == dateString}) {
                
                if updatedList[index].workouts.contains(where: { $0 == workout }) {
                    updatedList[index].workouts.append(workout)
                }
            } else {
                updatedList.append(ListItem(section: dateString, workouts: [workout]))
            }
        }
        return updatedList
    }
    
    func updateList(){
        listItems = addWorkout(listItems: listItems)
    }
    
    private func formatDateFromTimestamp(_ timestamp: String) -> String {
        let date = Date()
        return date.convertTimestamp(timeStamp: timestamp, isTime: false, isDate: true)
    }
}

extension WorkoutsViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let section = listItems.count
        return section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = listItems[section].workouts.count
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutCell.identifier) as? WorkoutCell ?? WorkoutCell()
        
        let workout = listItems[indexPath.section].workouts[indexPath.row]
        
        cell.workoutLabel.text = workout.name
        cell.remainingNumberLabel.text = "\(workout.slots.leftToBook) \(Localize.places_remaining.string)"
       
        let dateFormatter = Date()
        let timeStamp = workout.duration.start
        let time = dateFormatter.convertTimestamp(timeStamp: timeStamp, isTime: true)
       
        cell.timeLabel.text = time
        
        return cell
    }
}
