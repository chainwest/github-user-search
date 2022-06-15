import UIKit
import Moya
import RxSwift
import RxCocoa
import RxRelay

protocol GitHubSearchNetworkServiceProtocol: AnyObject {
    func getUserData(by name: String) -> Single<GitHubUsersResponse>
}

final class GitHubSearchNetworkService: GitHubSearchNetworkServiceProtocol {
    private let provider = MoyaProvider<GitHubSearchType>(plugins: [NetworkLoggerPlugin()])

    func getUserData(by name: String) -> Single<GitHubUsersResponse> {
        provider.rx.request(.user(name: name))
            .map(GitHubUsersResponse.self)
    }
}
