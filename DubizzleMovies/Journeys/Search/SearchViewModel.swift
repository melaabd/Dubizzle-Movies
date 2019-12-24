//
//  HomeDataController.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public final class SearchViewModel {
    
    // MARK: - Properties
    
    let disposaBag: DisposeBag = DisposeBag()
    private let tmdbAPI: TMDbAPI
    
    // MARK: - Reactive triggers (input)

    let textSearchTrigger: PublishRelay<String> = PublishRelay()
    let nextPageTrigger: PublishRelay<Void> = PublishRelay()
    
    // MARK: - Reactive drivers (output)

    lazy private(set) var filmsTask = makeFilmsTask()
    lazy private(set) var films = filmsTask.map { $0.result?.value ?? PaginatedList.empty }
    
    // MARK: - Initializer
    
    init(tmdbAPI: TMDbAPI) {
        self.tmdbAPI = tmdbAPI
    }

    // MARK: - Reactive Setup
    
    fileprivate func makeFilmsTask() -> Driver<Task<PaginatedList<Film>>> {
        
        let trigger = nextPageTrigger.debounce(.milliseconds(200), scheduler: MainScheduler.instance)
        
        return textSearchTrigger
            .asObservable()
            .distinctUntilChanged()
            .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
            .flatMapLatest { (query) -> Observable<Task<PaginatedList<Film>>> in
                Analytics.track(searchQuery: query)
                return Observable.concat([
                    Observable.just(Task.loading),
                    self.tmdbAPI.films(withTitle: query, loadNextPageTrigger: trigger).asTask()
                    ])
                
            }.asDriver(onErrorJustReturn: Task(GeneralError.default))
    }
}
