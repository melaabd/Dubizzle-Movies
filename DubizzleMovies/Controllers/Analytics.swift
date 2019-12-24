//
//  Analytics.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation
import Crashlytics

public struct Analytics {
    
    // MARK: - 
    
    static public func track(viewContent content: String, ofType type: String? = nil, withId id: String? = nil, withAttributes attributes: [String: Any]? = nil) {
        Answers.logContentView(withName: content, contentType: type, contentId: id, customAttributes: attributes)
    }
    
    static public func track(searchQuery query: String, withAttributes attributes: [String: Any]? = nil) {
        Answers.logSearch(withQuery: query, customAttributes: attributes)
    }
}
