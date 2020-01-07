//
//  CustomAlert.swift
//  GitHubFollowers
//
//  Created by TOOK on 07.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//

import UIKit

class CustomAlert: UIView {
    
    init(data: Data) {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fromNib()
        configureUI()
    }
    
    func configureUI() {
        
    }
    
    struct Data {
        var title: String
        var detail: String
        var okButtonTitle: String = "OK"
        var actionButtonTitle: String?
    }
}
