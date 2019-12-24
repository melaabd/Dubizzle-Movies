//
//  DecodableResponse.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation

class DecodableResponse<T: Decodable>: ResponseProtocol {
    
    // MARK: - ResponseProtocol properties
    
    let request: RequestProtocol
    let data: Result<Data>
    
    // MARK: - Properties
    
    lazy private(set) var decodedData: Result<T> = data.flatMap { Result<T>(jsonEncoded: $0) }
    
    // MARK: - Initializer
    
    required init(request: RequestProtocol, data: Result<Data>) {
        self.request = request
        self.data = data
    }
}
