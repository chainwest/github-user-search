import UIKit

extension UIViewController {
    func showAlert(
        withTitle title: String?,
        message: String? = nil,
        okButtonTitle: String = "Ok",
        isOkButtonDestructive: Bool = false,
        cancelButtonTitle: String? = nil,
        tintColor: UIColor = .systemBlue,
        onCancelTap: (() -> Void)? = nil,
        onTap: (() -> Void)? = nil
    ) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        if let cancelButtonTitle = cancelButtonTitle {
            alertController.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel) { _ in
                onCancelTap?()
            })
        }
        let okButtonStyle: UIAlertAction.Style = isOkButtonDestructive ? .destructive : .default
        alertController.addAction(UIAlertAction(title: okButtonTitle, style: okButtonStyle) { _ in
            onTap?()
        })
        showAlert(alertController, tintColor: tintColor)
    }

    func showAlert(
        withMessage message: String?,
        okButtonTitle: String = "Ok",
        isOkButtonDestructive: Bool = false,
        cancelButtonTitle: String? = nil,
        tintColor: UIColor = .systemBlue,
        onCancelTap: (() -> Void)? = nil,
        onTap: (() -> Void)? = nil
    ) {
        showAlert(
            withTitle: nil,
            message: message,
            okButtonTitle: okButtonTitle,
            isOkButtonDestructive: isOkButtonDestructive,
            cancelButtonTitle: cancelButtonTitle,
            tintColor: tintColor,
            onCancelTap: onCancelTap,
            onTap: onTap
        )
    }

    private func showAlert(_ alertController: UIAlertController, tintColor: UIColor = .systemBlue) {
        present(alertController, animated: true, completion: nil)
        alertController.view.tintColor = tintColor
    }
}
