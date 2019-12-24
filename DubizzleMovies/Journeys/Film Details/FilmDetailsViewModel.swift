//
//  FilmDetailsViewModel.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

public final class FilmDetailsViewModel {

    // MARK: - Properties
    
    let film: Film
    private let tmdbAPI: TMDbAPI
    
    // MARK: - Reactive drivers (output)

    private(set) lazy var filmDetail = makeFilmDetails()
    private(set) lazy var credits = makeCredits()
    
    // MARK: - Initializer
    
    init(withFilm film: Film, tmdbAPI: TMDbAPI) {
        self.film = film
        self.tmdbAPI = tmdbAPI
    }
    
    // MARK: -
    
    fileprivate func makeFilmDetails() -> Driver<Result<FilmDetail>> {
        return Observable
            .just(())
            .flatMapLatest { self.tmdbAPI.filmDetail(fromId: self.film.id) }
            .asResult()
            .asDriver(onErrorJustReturn: Result(GeneralError.default))
    }
    
    fileprivate func makeCredits() -> Driver<Result<FilmCredits>> {
        return Observable
            .just(())
            .flatMapLatest { self.tmdbAPI.credits(forFilmId: self.film.id) }
            .asResult()
            .asDriver(onErrorJustReturn: Result(GeneralError.default))
    }
}
