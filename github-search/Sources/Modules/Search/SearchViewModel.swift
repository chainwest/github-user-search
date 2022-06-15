import RxSwift
import RxCocoa
import RxSwiftExt

final class SearchViewModel {
    private let dependencies: DI

    let search = PublishRelay<String?>()
    let dataSource: Driver<[SearchCellViewModel]>
    let error: Observable<Error>

    init(dependencies: DI) {
        self.dependencies = dependencies

        let events = search.compactMap { $0 }
            .flatMapLatest {
                dependencies.networkService.getUserData(by: $0)
                    .asObservable()
                    .materialize()
            }.share()

        dataSource = events
            .elements()
            .map { response -> [SearchCellViewModel] in
                response.items
                    .map(SearchCellViewModel.init)
                    .sorted { first, second in
                        first.loginName < second.loginName
                    }
            }
            .asDriver(onErrorDriveWith: .never())

        error = events.errors()
    }
}
