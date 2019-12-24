//
//  Reactive+UIResponder.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public struct KeyboardInfo {
    
    // MARK: - Properties
    
    public let frameBegin: CGRect
    public let frameEnd: CGRect
    public let animationDuration: Double
    
    // MARK: - Initializer
    
    init(notification: Notification) {
        self.frameEnd = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue
        self.frameBegin = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey]! as AnyObject).cgRectValue
        self.animationDuration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
    }
}

// MARK: -

extension KeyboardInfo: Equatable {
    
    // MARK: - Equatable
}

// MARK: -

extension UIResponder {
    
    // MARK: -
    
    static var keyboardWillShow: Observable<KeyboardInfo> {
        return NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification).map { KeyboardInfo(notification: $0) }
    }
    
    static var keyboardDidShow: Observable<KeyboardInfo> {
        return NotificationCenter.default.rx.notification(UIResponder.keyboardDidShowNotification).map { KeyboardInfo(notification: $0) }
    }
    
    static var keyboardWillHide: Observable<KeyboardInfo> {
        return NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification).map { KeyboardInfo(notification: $0) }
    }
    
    static var keyboardDidHide: Observable<KeyboardInfo> {
        return NotificationCenter.default.rx.notification(UIResponder.keyboardDidHideNotification).map { KeyboardInfo(notification: $0) }
    }
}
