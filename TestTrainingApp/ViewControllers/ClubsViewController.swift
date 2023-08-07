//
//  ViewController.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-16.
//

import UIKit
import Combine

class ClubsViewController: BaseViewController {
    
    private let viewModel : ClubsViewModel
    private let dataManager : DataManager
    
    init(dataManager: DataManager, viewModel: ClubsViewModel){
        self.dataManager = dataManager
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.delegate = self
        view.dataSource = viewModel
        view.backgroundColor = .screenBackground
        view.separatorColor = .clear
        view.separatorStyle = .none
        view.register(ClubCell.self, forCellReuseIdentifier: ClubCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
   }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.setUpCustomNavBar(isHeaderImageVisible: true)
        setUpConstraints()
        viewModel.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bindValues()
    }
    
    private func bindValues(){
        viewModel.dataManager.$clubs.receive(on: DispatchQueue.main).sink(receiveValue: { [weak self] value in
            self?.viewModel.clubItems = value
            print(self?.viewModel.clubItems as Any)
            self?.tableView.reloadData()
        }).store(in: &cancellables)
    }
    
    private func setUpConstraints(){
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: .l),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .xs),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.xs),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ClubsViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .tableViewRowHeight
    }
    
}

extension ClubsViewController: ClubsDelegate {
    func presentViewController(indexPath: IndexPath){
        let club = viewModel.clubItems[indexPath.row]
        let workoutViewController = WorkoutsViewController(dataManager: dataManager, club: club)
        workoutViewController.navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.pushViewController(workoutViewController, animated: true)
    }
}

