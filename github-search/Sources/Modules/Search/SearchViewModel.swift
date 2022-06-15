import RxSwift
import RxCocoa
import RxSwiftExt

final class SearchViewModel {
    private let networkService: GitHubSearchNetworkServiceProtocol

    let search = PublishRelay<String?>()
    let dataSource: Driver<[SearchCellViewModel]>
    let error: Driver<String>

    init(networkService: GitHubSearchNetworkServiceProtocol) {
        self.networkService = networkService

        let events = search.compactMap { $0 }
            .flatMapLatest {
                networkService.getUserData(by: $0)
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

        error = events
            .errors()
            .map { $0.localizedDescription }
            .asDriver(onErrorDriveWith: .never())
    }
}
