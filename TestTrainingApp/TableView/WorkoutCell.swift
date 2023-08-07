//
//  WorkoutCellTableViewCell.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-16.
//

import UIKit

class WorkoutCell: UITableViewCell {
    
    static let identifier = Constants.UserDefault.TABLEVIEWCELL_WORKOUT_CELL_IDENTIFIER
    
    private let card: UIView = {
        let view = UIView()
        view.addCard(color: .whiteColor)
        return view
    }()
    
    let remainingNumberLabel: UILabel = {
        let label = UILabel()
        label.applyFont(font: .h5, color: .turquoiseColor)
        return label
    }()
    
    let workoutLabel: UILabel = {
        let label = UILabel()
        label.applyFont(font: .h3, color: .blackColor)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.applyFont(font: .h5, color: .blackColor, isBold: false)
        return label
    }()
    
    let instructorLabel: UILabel = {
        let label = UILabel()
        label.applyFont(font: .h5, color: .blackColor, isBold: false)
        label.text = " Marina Kristofferson"
        return label
    }()

    convenience init() {
        self.init(style: .default, reuseIdentifier: WorkoutCell.identifier)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setUpConstraints()
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints(){
        contentView.addSubview(card)
        card.addSubviews(remainingNumberLabel, workoutLabel, timeLabel, instructorLabel)
        
        NSLayoutConstraint.activate([
            
            card.topAnchor.constraint(equalTo: contentView.topAnchor),
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.xs),

            remainingNumberLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: .xs),
            
            workoutLabel.topAnchor.constraint(equalTo: remainingNumberLabel.bottomAnchor, constant: .cardRowSpacing),
            workoutLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: .xs),
            workoutLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -.xs),

            timeLabel.topAnchor.constraint(equalTo: workoutLabel.bottomAnchor, constant: .cardRowSpacing),
            timeLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: .xs),
            timeLabel.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -.xs),
            
            instructorLabel.topAnchor.constraint(equalTo: workoutLabel.bottomAnchor, constant: .cardRowSpacing),
            instructorLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor),
            instructorLabel.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -.xs)
        ])
    }
}
