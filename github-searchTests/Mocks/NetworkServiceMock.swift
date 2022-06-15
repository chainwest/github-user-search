import Foundation
import RxSwift

@testable import github_search

final class NetworkServiceMock: GitHubSearchNetworkServiceProtocol {
    func getUserData(by name: String) -> Single<GitHubUsersResponse> {
        let items = [
            UserResponse(login: "user", id: 1, nodeId: "", avatarUrl: "", gravatarId: "", url: "", htmlUrl: "", followersUrl: "", followingUrl: "", gistsUrl: "", starredUrl: "", subscriptionsUrl: "", organizationsUrl: "", reposUrl: "", eventsUrl: "", receivedEventsUrl: "", type: "", siteAdmin: false)
        ]
        let response = GitHubUsersResponse(totalCount: 1, incompleteResults: false, items: items)

        return Single.just(response)
    }
}
