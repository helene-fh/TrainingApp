//
//  ClubsViewModel.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-16.
//

import Combine
import UIKit

protocol ClubsDelegate {
    func presentViewController(indexPath: IndexPath)
}

class ClubsViewModel: NSObject {

    let dataManager: DataManager
    var clubItems : [ClubModel] = []
    var adress : AddressModel?
    private let cancellables: [AnyCancellable] = []
    var delegate : ClubsDelegate?
    
    init(dataManager: DataManager){
        self.dataManager = dataManager
        super.init()
    }
}

extension ClubsViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ClubCell.identifier) as? ClubCell ?? ClubCell()
        let club = clubItems[indexPath.row]
        let trimmedLabel = dataManager.trimWorkoutLabel(clubName: club.name)
        
        cell.clubLabel.text = trimmedLabel
        
        cell.listClubWorkouts = { [self] in
            delegate?.presentViewController(indexPath: indexPath)
        }
        
        return cell
    }
}

