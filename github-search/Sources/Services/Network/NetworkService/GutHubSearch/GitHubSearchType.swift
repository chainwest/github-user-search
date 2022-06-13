import Moya

enum GitHubSearchType {
    case user(name: String)
}

extension GitHubSearchType: TargetType {
    var baseURL: URL {
        URL(string: URLFactory.base)!
    }

    var path: String {
        switch self {
        case .user:
            return URLFactory.GitHub.userSearch
        }
    }

    var method: Method {
        .get
    }

    var task: Task {
        switch self {
        case .user(let name):
            return .requestParameters(
                parameters: [
                    "q" : name,
                    "per_page" : 9
                ],
                encoding: URLEncoding.default
            )
        }
    }

    var headers: [String : String]? { nil }
}
