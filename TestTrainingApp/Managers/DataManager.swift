//
//  ClubsViewModel.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-16.
//

import UIKit
import Combine

class DataManager: ObservableObject {

    @Published var clubs: [ClubModel] = []
    @Published var workouts: [WorkoutModel] = []
    
    private var cancellables = Set<AnyCancellable>()

    init(){
        self.fetchClubs()
    }
    
    func fetchClubs(){
        ApiClient.shared.fetchFromAPI(endPoint: .clubs, type: ClubResponse.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished fetching Clubs")
                }
            } receiveValue: { [weak self] clubResponse in
                self?.clubs = clubResponse.map { ClubModel(id: $0.id, name: $0.name, address: $0.address) }
            }
            .store(in: &cancellables)
    }
    
    func fetchWorkouts(id: Int){
        ApiClient.shared.fetchFromAPI(id: Optional(id), endPoint: .workouts, type: WorkoutResponse.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished fetching Workouts")
                }
            } receiveValue: { [weak self] workoutResponse in
                self?.workouts = workoutResponse.map { WorkoutModel(id: $0.id, name: $0.name, duration: $0.duration, slots: $0.slots) }
            }
            .store(in: &cancellables)
    }
    
    func trimWorkoutLabel(clubName: String) -> String{
        let clubName = clubName
        if clubName.hasPrefix("STC "){
            let trimmedName = String(clubName.dropFirst(4))
            return trimmedName
        }
        return clubName
    }
}
