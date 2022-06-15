import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private lazy var mainCoordinator = createMainCoordinator()
    private lazy var networkService: GitHubSearchNetworkServiceProtocol = GitHubSearchNetworkService()

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startMainCoordinator()
        return true
    }

    private func createMainCoordinator() -> Coordinator {
        let windowFrame = UIScreen.main.bounds
        let newWindow = UIWindow(frame: windowFrame)
        let navigationController = UINavigationController()
        self.window = newWindow

        return MainCoordinator(
            window: window,
            navigationController: navigationController,
            networkService: networkService
        )
    }

    private func startMainCoordinator() {
        mainCoordinator.start()
    }
}
