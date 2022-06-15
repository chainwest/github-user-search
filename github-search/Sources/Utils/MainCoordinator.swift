import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }

    func start()
}

final class MainCoordinator: Coordinator {
    private var window: UIWindow?
    private var childCoordinators = [Coordinator]()

    private let networkService: GitHubSearchNetworkServiceProtocol

    var navigationController: UINavigationController

    init(
        window: UIWindow?,
        navigationController: UINavigationController,
        networkService: GitHubSearchNetworkServiceProtocol
    ) {
        self.window = window
        self.navigationController = navigationController
        self.networkService = networkService
        setupNavigationController()
    }

    private func setupNavigationController() {
        navigationController.toolbar.tintColor = .black
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.backgroundColor = .clear
        navigationController.navigationBar.prefersLargeTitles = true
    }

    func start() {
        guard let window = window else { return }
        let coordinator = SearchCoordinator(
            navigationController: navigationController,
            networkService: networkService
        )
        
        childCoordinators.append(coordinator)
        coordinator.start()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

