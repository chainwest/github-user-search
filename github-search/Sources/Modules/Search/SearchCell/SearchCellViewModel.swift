import Foundation

struct SearchCellViewModel {
    let avatarImageUrlString: String
    let loginName: String
    let profileType: String

    init(data: UserResponse) {
        avatarImageUrlString = data.avatarUrl
        loginName = data.login
        profileType = data.type
    }
}
