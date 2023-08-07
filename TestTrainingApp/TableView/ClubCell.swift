//
//  ClubCell.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-16.
//

import UIKit

class ClubCell: UITableViewCell {
    
    static let identifier = Constants.UserDefault.TABLEVIEWCELL_CLUB_CELL_IDENTIFIER
    var listClubWorkouts : () -> () = {}
    
    private let card: UIView = {
        let view = UIView()
        view.addCard(color: .blackColor)
        return view
    }()
    
    let clubLabel: UILabel = {
        let label = UILabel()
        label.applyFont(font: .h3, color: .whiteColor)
        return label
    }()
    
    lazy var arrowRight: UIButton = {
        var button = UIButton()
        button.applyButton(button: .arrowRight)
        button.addTarget(self, action: #selector(handleClubPressed), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func handleClubPressed(){
        print("Club Pressed")
        self.listClubWorkouts()
    }

    convenience init() {
        self.init(style: .default, reuseIdentifier: ClubCell.identifier)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setUpConstraints()
        backgroundColor = .screenBackground
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints(){
        contentView.addSubview(card)
        card.addSubviews(clubLabel, arrowRight)
        
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: contentView.topAnchor),
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.xs),
            
            clubLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: .xs),
            clubLabel.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -.xs),
            clubLabel.trailingAnchor.constraint(equalTo: arrowRight.leadingAnchor, constant: -.xs),
            
            arrowRight.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -.xs),
            arrowRight.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -.xs),
            arrowRight.widthAnchor.constraint(equalToConstant: .arrowRightWidth),
        ])
    }
}
