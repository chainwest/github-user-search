import XCTest
import RxBlocking
import RxSwift

@testable import github_search

final class NetworkServiceTests: XCTestCase {
    var networkService: GitHubSearchNetworkService!

    override func setUp() {
        super.setUp()
        networkService = GitHubSearchNetworkService()
    }

    override func tearDown() {
        super.tearDown()
        networkService = nil
    }

    func testIsIncompleteResultsFalse() {
        let single = try! networkService.getUserData(by: "user").asObservable().toBlocking().first()
        let result = single?.incompleteResults
        XCTAssertEqual(result, false)
    }
}
