//
//  String+Tools.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation

extension String {
    
    var initials: String {
        return components(separatedBy: " ").reduce("") { (string, nextWord) -> String in
            guard nextWord.count > 0 else { return string }
            return string + nextWord.prefix(1).uppercased()
        }
    }
    
    func initials(upTo maxLength: Int) -> String {
        return String(initials.prefix(maxLength))
    }
    
    var asURL: URL? {
        return URL(string: self)
    }
}
