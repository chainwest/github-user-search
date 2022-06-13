import UIKit
import Moya
import RxSwift
import RxCocoa
import RxRelay

final class GitHubSearchNetworkService {
    private let provider = MoyaProvider<GitHubSearchType>()

    func getUserData(by name: String) -> Single<GitHubUsersResponse> {
        provider.rx.request(.user(name: name))
            .map(GitHubUsersResponse.self)
    }
}
