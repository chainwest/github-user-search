import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var dependencies: DI { get set }

    func start()
}

final class MainCoordinator: Coordinator {
    private var window: UIWindow?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var dependencies: DI

    init(
        window: UIWindow?,
        navigationController: UINavigationController,
        dependencies: DI
    ) {
        self.window = window
        self.navigationController = navigationController
        self.dependencies = dependencies
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
        let coordinator = SearchCoordinator(navigationController: navigationController, dependencies: dependencies)
        
        childCoordinators.append(coordinator)
        coordinator.start()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

