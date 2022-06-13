import UIKit
import Kingfisher

final class SearchCellView: UITableViewCell {
    private let avatarImageView = UIImageView()
    private let loginLabel = UILabel()
    private let loginType = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        assertionFailure()
        return nil
    }

    func configure(with viewModel: SearchCellViewModel) {
        let imageUrl = URL(string: viewModel.avatarImageUrlString)
        avatarImageView.kf.setImage(with: imageUrl)
        loginLabel.text = viewModel.loginName
        loginType.text = viewModel.profileType
    }

    private func setup() {
        setupAvatarImageView()
        setupLoginLabel()
        setupLoginType()
    }

    private func setupAvatarImageView() {
        contentView.addSubview(avatarImageView)
        avatarImageView.makeRoundedCorners(radius: 20)
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    private func setupLoginLabel() {
        contentView.addSubview(loginLabel)
        loginLabel.numberOfLines = 1
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            loginLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            loginLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }

    private func setupLoginType() {
        contentView.addSubview(loginType)
        loginType.numberOfLines = 1
        loginType.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginType.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 2),
            loginType.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            loginType.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            loginType.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}
