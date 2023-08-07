//
//  UIViewExt.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-17.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...){
        views.forEach({self.addSubview($0)})
    }
    
    func addCard(color: UIColor?){
        backgroundColor = color
        layer.cornerRadius = .cornerRadius
        translatesAutoresizingMaskIntoConstraints = false
    }
}
