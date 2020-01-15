//
//  EmptyView.swift
//  GitHubFollowers
//
//  Created by TOOK on 12.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//

import UIKit

class EmptyView: UIView {
    
    private let title = UILabel()
    private let imageView = UIImageView()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String) {
        super.init(frame: .zero)
        self.title.text = title
        configure()
    }
    
    
    private func configure() {
        addSubview(title)
        addSubview(imageView)
        title.numberOfLines = 3
        title.textColor = .secondaryLabel
        title.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        title.textAlignment = .center
        imageView.image = UIImage(named: "empty-state-logo")
        
        title.anchorCenterYToSuperview(constant: -150)
        title.anchor(nil, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, width: nil, height: nil, topConstant: 0, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 200)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.3),
            imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.3),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 170),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 40)
        ])
        
    }
}
