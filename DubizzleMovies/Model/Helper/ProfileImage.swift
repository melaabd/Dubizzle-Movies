//
//  ProfileImage.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation

struct ProfileImage: Decodable {
    
    // MARK: - Properties
    
    let filePath: String
    
    // MARK: - Keys
    
    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
    }

    // MARK: - Initializer
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.filePath = try container.decode(String.self, forKey: .filePath)
    }
}
