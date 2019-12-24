//
//  ServiceConfiguration.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation

struct ServiceConfiguration {
    
    // MARK: - Properties
    
    let urlScheme: String
    let urlHost: String
    let defaultHTTPHeaders: [String: String]
    let defaultURLParameters: [URLParameter]
}
