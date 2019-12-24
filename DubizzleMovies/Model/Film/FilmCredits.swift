//
//  FilmCredits.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation

public struct FilmCredits: Decodable {
    
    // MARK: - Properties
    
    let cast: [Person]
    let crew: [Person]
}
