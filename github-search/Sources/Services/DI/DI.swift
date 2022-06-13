import Foundation

final class DI {
    let networkService: GitHubSearchNetworkService

    init(networkService: GitHubSearchNetworkService) {
        self.networkService = networkService
    }

    static func makeDefaultAssembly() -> DI {
        DI(
            networkService: GitHubSearchNetworkService()
        )
    }
}
