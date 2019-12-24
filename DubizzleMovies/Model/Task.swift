//
//  Task.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation
import RxSwift

public enum Task<T> {
    
    // MARK: - Cases
    
    case loading
    case completed(Result<T>)
    
    // MARK: - Initializer
    
    init(_ value: T) {
        self = .completed(Result(value))
    }
    
    init(_ error: Error) {
        self = .completed(Result(error))
    }
}

// MARK: -

extension Task {
    
    // MARK: - Computed properties
    
    var isLoading: Bool {
        guard case .loading = self else { return false }
        return true
    }
    
    var result: Result<T>? {
        guard case let .completed(result) = self else { return nil }
        return result
    }
}

// MARK: -

extension ObservableType {
    
    // MARK: - Materialize as a task
    
    public func asTask() -> RxSwift.Observable<Task<Self.E>> {
        return asResult().map { Task.completed($0) }
    }
}
