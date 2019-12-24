//
//  UIImageView+ImageManager.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import UIKit

var imageViewImageManagerAssociatedObjectHandle: UInt8 = 0

extension UIImageView {
    
    static var imageManager: ImageManager? {
        get {
            return objc_getAssociatedObject(self, &imageViewImageManagerAssociatedObjectHandle) as? ImageManager
        }
        set {
            objc_setAssociatedObject(self, &imageViewImageManagerAssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func setImage(fromTMDbPath path: ImagePath, withSize size: ImageSize, animatedOnce: Bool = true, withPlaceholder placeholder: UIImage? = nil) {
        guard let imageURL = UIImageView.imageManager?.url(fromTMDbPath: path, withSize: size) else { return }
        let hasImage: Bool = (self.image != nil)
        self.sd_setImage(with: imageURL, placeholderImage: nil, options: .avoidAutoSetImage) { [weak self] (image, error, cacheType, url) in
            if animatedOnce && !hasImage && cacheType == .none {
                self?.alpha = 0.0
                UIView.animate(withDuration: 0.5) { self?.alpha = 1.0 }
            }
            self?.image = image
        }
    }
}
