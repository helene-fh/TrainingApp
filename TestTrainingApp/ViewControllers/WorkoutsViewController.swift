//
//  WorkoutsViewController.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-16.
//

import UIKit
import Combine

class WorkoutsViewController: BaseViewController {
    
    var clubModel : ClubModel?
    var adressModel : AddressModel?
    private var viewModel : WorkoutsViewModel
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.applyFont(font: .h1, color: .whiteColor)
        label.text = clubModel?.name
        return label
    }()

    private lazy var streetLabel : UILabel = {
        var label = UILabel()
        label.applyFont(font: .h4, color: .whiteColor, isBold: false)
        label.text = clubModel?.address.street
        return label
    }()
    
    private lazy var postalCodeLabel : UILabel = {
        var label = UILabel()
        label.applyFont(font: .h4, color: .whiteColor, isBold: false)
        label.text = clubModel?.address.postalCode
        return label
    }()
    
    private lazy var cityLabel : UILabel = {
        var label = UILabel()
        label.applyFont(font: .h4, color: .whiteColor, isBold: false)
        label.text = clubModel?.address.city
        return label
    }()
    
    private lazy var upcomingSessionsLabel : UILabel = {
        var label = UILabel()
        label.applyFont(font: .h4, color: .greyColor, isBold: true)
        label.text = Localize.upcoming_sessions.string
        return label
    }()
    
   lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.delegate = self
        view.dataSource = viewModel
        view.backgroundColor = .screenBackground
        view.separatorColor = .clear
        view.separatorStyle = .none
        view.register(WorkoutCell.self, forCellReuseIdentifier: WorkoutCell.identifier)
        view.register(WorkoutSection.self, forHeaderFooterViewReuseIdentifier: WorkoutSection.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
   }()

    init(viewModel: WorkoutsViewModel, club: ClubModel){
        self.viewModel = viewModel
        self.clubModel = club
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.dataManager.fetchWorkouts(id: clubModel!.id)
        updateHeader()
        setUpConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateValues()
    }
    
    private func updateHeader(){
        headerView.setUpCustomNavBar(isBackButtonVisible: true)
        headerView.backButton.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        headerView.addInformationToHeader(title: titleLabel ,street: streetLabel, postalCode: postalCodeLabel, city: cityLabel)
    }
    
    @objc
    private func handleBackButton(){
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func updateValues(){
        viewModel.dataManager.$workouts.receive(on: DispatchQueue.main).sink(receiveValue: { [weak self] value in
            self?.viewModel.workoutItems = value
            print(self?.viewModel.workoutItems as Any)
            self?.viewModel.updateList()
            self?.tableView.reloadData()
        }).store(in: &cancellables)
    }
    
    private func setUpConstraints(){
        view.addSubviews(tableView, upcomingSessionsLabel)
        
        NSLayoutConstraint.activate([
            upcomingSessionsLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: .l),
            upcomingSessionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .xs),
            
            tableView.topAnchor.constraint(equalTo: upcomingSessionsLabel.bottomAnchor, constant: .xs),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .xs),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.xs),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension WorkoutsViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .tableViewRowHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .tableViewSectionHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: WorkoutSection.identifier) as? WorkoutSection ?? WorkoutSection()
        let section = viewModel.listItems[section].section
        view.dateLabel.text = section
        
        return view
    }
}

