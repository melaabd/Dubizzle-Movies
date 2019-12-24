//
//  DiscoverParameters.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation

public struct DiscoverParameters {
    
    // MARK: - Properties
    
    let sortBy: FilmSortingCriterion
    let page: Int?
    
    // MARK: - Initializers
    
    init(sortBy sortingCriterion: FilmSortingCriterion, atPage page: Int? = nil) {
        self.sortBy = sortingCriterion
        self.page = page
    }
}

// MARK: -

extension DiscoverParameters: URLParametersSerializable {
    
    // MARK: - URLParametersListSerializable
    
    var asURLParameters: [URLParameter] {
        var parameters = [URLParameter]()
        parameters.append(URLParameter(key: "sort_by", value: sortBy.value))
        if let page = self.page { parameters.append(URLParameter(key: "page", value: "\(page + 1)")) } // Pagination starts at 1 on TMDb API
        return parameters
    }
}
