import UIKit

final class SearchCoordinator: Coordinator {
    var navigationController: UINavigationController
    let networkService: GitHubSearchNetworkServiceProtocol

    init(
        navigationController: UINavigationController,
        networkService: GitHubSearchNetworkServiceProtocol
    ) {
        self.navigationController = navigationController
        self.networkService = networkService
    }

    func start() {
        let viewModel = SearchViewModel(networkService: networkService)
        let vc = SearchViewController(viewModel: viewModel)
        navigationController.setViewControllers([vc], animated: false)
    }
}
