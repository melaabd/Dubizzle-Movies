//
//  OrderingCriteria.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation

// MARK: - OrderingCriteria enum

public enum OrderingCriteria {
    
    // MARK: - Properties
    
    var stringPath: String {
        switch self {
        case .ascending: return ".asc"
        case .descending: return ".desc"
        }
    }
    
    // MARK: - Cases
    
    case ascending
    case descending
}
