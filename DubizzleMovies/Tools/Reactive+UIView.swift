//
//  Reactive+UIView.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UIView {
    
    // MARK: - UIScrollView reactive extension
    
    public var bounds: Observable<CGRect> {
        return observe(CGRect.self, "bounds").flatMap { Observable.from(optional: $0) }
    }
}
