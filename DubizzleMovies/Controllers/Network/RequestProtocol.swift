//
//  RequestProtocol.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation

protocol RequestProtocol {
    
    // MARK: - Properties
    
    var path: String { get }
    var method: RequestMethod { get }
    var body: RequestBody? { get }
    var headers: [String: String] { get }
    var parameters: [URLParameter] { get }
}

// MARK: -

extension RequestProtocol {
    
    // MARK: - Default properties
    
    
}
