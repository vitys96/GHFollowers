//
//  CustomAlert.swift
//  GitHubFollowers
//
//  Created by TOOK on 07.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//

import UIKit

class CustomAlert: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    var didSelectCloseButton: (()-> Void)?
    
    init(data: Data) {
        super.init(frame: .zero)
        fromNib()
        titleLabel.text = data.title
        detailLabel.text = data.detail
        okButton.setTitle(data.okButtonTitle, for: .normal)
        okButton.setTitle(data.okButtonTitle, for: .highlighted)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fromNib()
        configureUI()
    }
    
    func configureUI() {
        okButton.backgroundColor = .systemPink
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .label
        detailLabel.textColor = .secondaryLabel
        detailLabel.font = UIFont.preferredFont(forTextStyle: .body)
        okButton.layer.cornerRadius = 10
        okButton.setTitleColor(.white, for: .normal)
    }
    
    struct Data {
        var title: String
        var detail: String
        var okButtonTitle: String = "OK"
        var actionButtonTitle: String?
    }
    @IBAction func didTouchOkButton(_ sender: Any) {
        didSelectCloseButton?()
    }
}
