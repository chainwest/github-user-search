import UIKit

final class SearchCoordinator: Coordinator {
    var navigationController: UINavigationController
    var dependencies: DI

    init(
        navigationController: UINavigationController,
        dependencies: DI
    ) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    func start() {
        let viewModel = SearchViewModel(dependencies: dependencies)
        let vc = SearchViewController(viewModel: viewModel)
        navigationController.setViewControllers([vc], animated: false)
    }
}
