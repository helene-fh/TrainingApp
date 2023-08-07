//
//  Header.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-16.
//

import UIKit

class Header: UIView {

    private var headerHeight: CGFloat = .headerHeight
    
    private var navBarContainer: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let backButton: UIButton = {
        var button = UIButton()
        button.applyButton(button: .arrowLeft)
        return button
    }()
    
    private let logo: UIImageView = {
        var image = UIImage(named: Icons.logo)
        var imageView = UIImageView(image: image)
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let menu: UIButton = {
        var button = UIButton()
        button.applyButton(button: .menu)
        return button
    }()
    
    let headerImage: UIImageView = {
        var image = UIImage(named: Icons.clubsHeader)
        var imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let informationContainer: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .blackColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCustomNavBar(isBackButtonVisible: Bool = false, isHeaderImageVisible: Bool = false){
        addSubview(navBarContainer)
        navBarContainer.addSubviews(logo, menu)
        
        NSLayoutConstraint.activate([
            
            navBarContainer.topAnchor.constraint(equalTo: topAnchor, constant: .navBarTopSpacing),
            navBarContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .l),
            navBarContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.l),
            navBarContainer.heightAnchor.constraint(equalToConstant: .navBarHeight),
            
            logo.topAnchor.constraint(equalTo: navBarContainer.topAnchor),
            logo.centerXAnchor.constraint(equalTo: centerXAnchor),
            menu.topAnchor.constraint(equalTo: navBarContainer.topAnchor),
            menu.trailingAnchor.constraint(equalTo: navBarContainer.trailingAnchor),
        ])
        
        if isBackButtonVisible == true {
            navBarContainer.addSubview(backButton)
            NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: navBarContainer.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: navBarContainer.leadingAnchor),
            ])
        }
        
        if isHeaderImageVisible == true {
            addSubviews(headerImage)
            headerImage.addSubviews(navBarContainer)
            NSLayoutConstraint.activate([
            headerImage.topAnchor.constraint(equalTo: topAnchor),
            headerImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
        }
    }
    
    func addInformationToHeader(title: UILabel, street: UILabel, postalCode: UILabel, city: UILabel){
        addSubviews(informationContainer)
        informationContainer.addSubviews(title, street, postalCode, city)
        
        NSLayoutConstraint.activate([
            
            informationContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            informationContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            informationContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
           
            title.topAnchor.constraint(equalTo: informationContainer.topAnchor, constant: .xs),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .l),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.l),
            
            street.topAnchor.constraint(equalTo: title.bottomAnchor, constant: .xs),
            street.leadingAnchor.constraint(equalTo: informationContainer.leadingAnchor, constant: .l),
            
            postalCode.topAnchor.constraint(equalTo: street.bottomAnchor),
            postalCode.leadingAnchor.constraint(equalTo: informationContainer.leadingAnchor, constant: .l),
            postalCode.bottomAnchor.constraint(equalTo: informationContainer.bottomAnchor, constant: -.l),
            city.topAnchor.constraint(equalTo: street.bottomAnchor),
            city.leadingAnchor.constraint(equalTo: postalCode.trailingAnchor, constant: .cardRowSpacing),
            city.bottomAnchor.constraint(equalTo: informationContainer.bottomAnchor, constant: -.l)
        ])
    }
    
    func pinHeader(to view: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: headerHeight),
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

