//
//  FollowerCell.swift
//  GitHubFollowers
//
//  Created by TOOK on 09.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//

import UIKit
import SDWebImage

class FollowerCell: UIView {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    // MARK: Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        fromNib()
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fromNib()
        configureUI()
    }
    
    func configure(data: Data) {
        userNameLabel.text = data.userName
        avatarImageView.sd_setImage(with: URL(string: data.imageUrl), placeholderImage: UIImage(named: "avatar-placeholder")) {[weak self] (image, _, _, _) in
            if let image = image?.withRenderingMode(.alwaysOriginal) {
                self?.avatarImageView.image = image
            }
        }
    }
    
    private func configureUI() {
        userNameLabel.textAlignment = .center
//        avatarImageView.image = UIImage(named: "avatar-placeholder")
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 12
        userNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        userNameLabel.textColor = .label
    }
}

extension FollowerCell {
    struct Data {
        var imageUrl: String
        var userName: String
    }
}

// MARK: - Touches
extension FollowerCell {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.5, options: [], animations: {
            self.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
        })
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.2) {
            self.transform = .identity
        }
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: 0.2) {
            self.transform = .identity
        }
    }
}
