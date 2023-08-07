//
//  UIButtonExt.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-17.
//

import UIKit

enum Buttons {
    case arrowRight
    case arrowLeft
    case menu
}

extension UIButton {
    func applyButton(button: Buttons){
        switch button {
        case .arrowRight:
            let image = UIImage(named: Icons.arrowRight)
            setImage(image, for: .normal)
        case .arrowLeft:
            let image = UIImage(named: Icons.arrowLeft)
            setImage(image, for: .normal)
        case .menu:
            let image = UIImage(named: Icons.menu)
            setImage(image, for: .normal)
        }
        contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }
}
