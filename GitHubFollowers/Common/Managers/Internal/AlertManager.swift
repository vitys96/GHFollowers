//
//  AlertManager.swift
//  GitHubFollowers
//
//  Created by TOOK on 08.01.2020.
//  Copyright © 2020 TOOK. All rights reserved.
//


import Foundation
import SwiftEntryKit

struct AlertManager {
    private static var currentAlert: UIView?
    static func closeCurrentAlert(completion: (()->())? = nil) {
        SwiftEntryKit.dismiss(with: completion)
    }
    static func showBonusAlert(data: CustomAlert.Data, didSelectActionButton: (()-> Void)? = nil, didSelectCloseButton: (()-> Void)? = nil) {
        AlertManager.currentAlert?.window?.rootViewController?.view.isUserInteractionEnabled = true
        
        let bonusAlertView = CustomAlert.init(data: data)
        bonusAlertView.didSelectCloseButton = {
            SwiftEntryKit.dismiss(with: didSelectCloseButton)
        }
//        bonusAlertView.didSelectActionButton = {
//            didSelectActionButton?()
//            SwiftEntryKit.dismiss()
//        }
        var attributes = bannerAlertAttributes()
        attributes.lifecycleEvents.didDisappear = {
            AlertManager.currentAlert = nil
        }
        if SwiftEntryKit.isCurrentlyDisplaying(entryNamed: "CustomAlert") {
            SwiftEntryKit.transform(to: bonusAlertView)
        } else {
            SwiftEntryKit.display(entry: bonusAlertView, using: attributes)
        }
        currentAlert = bonusAlertView
        
    }
}

extension AlertManager {
    private static func bannerAlertAttributes(backgroundColor: UIColor = .systemBackground, horizontalOffset: CGFloat = 16, radius: CGFloat = 16) -> EKAttributes {
        var attributes: EKAttributes = defaultAttributes(canBeClosed: true)
        attributes.roundCorners = .all(radius: radius)
        attributes.screenBackground = .visualEffect(style: .dark)
        attributes.entryBackground = .color(color: .init(backgroundColor))
        attributes.positionConstraints.maxSize = .init(width: .offset(value: horizontalOffset), height: .intrinsic)
        attributes.border = .none
        attributes.shadow = .none
        return attributes
    }
    
    private static func defaultAttributes(canBeClosed: Bool = true) -> EKAttributes {
        var attributes: EKAttributes
        attributes = .centerFloat
        attributes.windowLevel = .normal
        attributes.hapticFeedbackType = .success
        attributes.screenInteraction =  canBeClosed ? .dismiss : .absorbTouches
        attributes.entryInteraction = .absorbTouches
        attributes.roundCorners = .all(radius: 16)
        attributes.scroll = .enabled(swipeable: canBeClosed ? true : false, pullbackAnimation: .jolt)
        attributes.screenBackground = .color(color: .init(UIColor(white: 0, alpha: 0.7)))
        attributes.entryBackground = .color(color: .white)
        attributes.entranceAnimation = .init(scale: .init(from: 0.9, to: 1, duration: 0.4, spring: .init(damping: 1, initialVelocity: 0)), fade: .init(from: 0, to: 1, duration: 0.3))
        attributes.exitAnimation = .init(scale: .init(from: 1, to: 0.9, duration: 0.4, spring: .init(damping: 1, initialVelocity: 0)), fade: .init(from: 1, to: 0, duration: 0.3))
        attributes.displayDuration = .infinity
        attributes.border = .value(color: .black, width: 0.5)
        attributes.shadow = .active(with: .init(color: .black, opacity: 0.3, radius: 5, offset: .zero))
        attributes.positionConstraints.maxSize = .init(width: .offset(value: CGFloat(16.0)), height: .intrinsic)
        attributes.positionConstraints.keyboardRelation = .bind(offset: .init(bottom: 10, screenEdgeResistance: -200))
        return attributes
    }
}
