//
//  FilmCredit.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import UIKit

public final class FilmCredited: Film {

    // MARK: - Properties
    
    let category: PersonCategory?
    
    // MARK: - Initializer
    
    public required init(from decoder: Decoder) throws {
        self.category = try PersonCategory(from: decoder)
        try super.init(from: decoder)
    }
}
