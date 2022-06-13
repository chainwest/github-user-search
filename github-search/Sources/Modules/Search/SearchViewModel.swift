import RxSwift
import RxCocoa

final class SearchViewModel {
    private let dependencies: DI

    let search = PublishRelay<String?>()
    let dataSource: Driver<[SearchCellViewModel]>

    init(dependencies: DI) {
        self.dependencies = dependencies

        dataSource = search.compactMap { $0 }
        .flatMapLatest {
            dependencies.networkService.getUserData(by: $0)
        }
        .map { response -> [SearchCellViewModel] in
            response.items.map(SearchCellViewModel.init)
        }
        .asDriver(onErrorDriveWith: .never())
    }
}
