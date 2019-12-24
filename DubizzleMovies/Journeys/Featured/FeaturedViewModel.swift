//
//  FeaturedViewModel.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class FeaturedViewModel {
    
    // MARK: - Properties
    
    let disposeBag = DisposeBag()
    private let tmdbAPI: TMDbAPI
    
    // MARK: - Reactive triggers (input)
    
    let reloadTrigger: PublishRelay<Void> = PublishRelay()
    let nextPageTrigger: PublishRelay<Void> = PublishRelay()
    
    // MARK: - Reactive drivers (output)
    
    lazy private(set) var filmsTask = makeFilmsDriver()
    
    // MARK: - Initializer
    
    init(tmdbAPI: TMDbAPI) {
        self.tmdbAPI = tmdbAPI
    }
    
    // MARK: - Reactive Setup
    
    fileprivate func makeFilmsDriver() -> Driver<Task<PaginatedList<Film>>> {
        
        let nextPage = nextPageTrigger.debounce(.milliseconds(200), scheduler: MainScheduler.instance)
        
        let sequence = Observable.concat([
            Observable.just(Task.loading),
            self.tmdbAPI.popularFilms(startingAtPage: 0, loadNextPageTrigger: nextPage).asTask()
            ])
        
        return reloadTrigger
            .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
            .flatMapLatest { sequence }
            .asDriver(onErrorJustReturn: Task(GeneralError.default))
    }
}
