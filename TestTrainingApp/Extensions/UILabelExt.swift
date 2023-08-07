//
//  UILabelExt.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-17.
//

import UIKit

enum Fonts {
    case h1
    case h2
    case h3
    case h4
    case h5
}

extension UILabel {
    func applyFont(font: Fonts, color: UIColor?, isBold: Bool = true){
        switch font {
        case .h1:
            self.font = UIFont(name: "WorkSans-Bold", size: 56)
        case .h2:
            self.font = UIFont(name: "WorkSans-Bold", size: 40)
        case .h3:
            self.font = UIFont(name: "WorkSans-Bold", size: 24)
        case .h4:
            self.font = UIFont(name: isBold ? "WorkSans-Bold" : "WorkSans-Medium", size: 16)
        case .h5:
            self.font = UIFont(name: isBold ? "WorkSans-Bold" : "WorkSans-Medium", size: 14)
        }
        
        textColor = color
        adjustsFontSizeToFitWidth = true
        numberOfLines = 2
        translatesAutoresizingMaskIntoConstraints = false
    }
}
