//
//  PersonViewModel.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class PersonViewModel {
    
    // MARK: - UI Drivers
    
    lazy private(set) var personDetail = makePersonDetailDriver()
    lazy private(set) var filmsCredits = makePersonFilmsCredit()
    
    // MARK: - Properties
    
    let person: Person
    private let tmdbAPI: TMDbAPI
    
    // MARK: - Initializer
    
    init(withPerson person: Person, tmdbAPI: TMDbAPI) {
        self.person = person
        self.tmdbAPI = tmdbAPI
    }
    
    // MARK: -
    
    private func makePersonDetailDriver() -> Driver<Result<PersonDetail>> {
        return Observable
            .just(())
            .flatMapLatest { self.tmdbAPI.person(forId: self.person.id) }
            .asResult()
            .asDriver(onErrorJustReturn: Result(GeneralError.default))
    }
    
    private func makePersonFilmsCredit() -> Driver<Result<PersonCreditedFilms>> {
        return Observable
            .just(())
            .flatMapLatest { self.tmdbAPI.filmsCredited(forPersonId: self.person.id) }
            .asResult()
            .asDriver(onErrorJustReturn: Result(GeneralError.default))
    }
}
