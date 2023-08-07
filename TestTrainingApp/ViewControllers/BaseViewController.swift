//
//  BaseViewController.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-17.
//

import UIKit
import Combine

class BaseViewController: UIViewController {
    
    var cancellables = Set<AnyCancellable>()
    
    var headerView: Header = {
        let header = Header()
        return header
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .screenBackground
        view.addSubview(headerView)
        headerView.pinHeader(to: view)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
       return .lightContent
    }
    
}
