//
//  WorkoutSectionHeader.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-17.
//

import UIKit

class WorkoutSection: UITableViewHeaderFooterView {

    static let identifier = Constants.Identifiers.TABLEVIEWCELL_WORKOUT_SECTION_IDENTIFIER
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.applyFont(font: .h2, color: .blackColor)
        return label
    }()
    
    convenience init(){
        self.init(reuseIdentifier: WorkoutSection.identifier)
    }
    
    override init(reuseIdentifier: String?){
        super.init(reuseIdentifier: reuseIdentifier)
        backgroundView = UIView()
        backgroundView?.backgroundColor = .screenBackground
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraint(){
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

}
