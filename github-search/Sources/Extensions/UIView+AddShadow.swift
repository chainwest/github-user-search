import UIKit

extension UIView {
    func addShadow(
        color: UIColor,
        offset: CGSize = .zero,
        opacity: Float = 1,
        blur: CGFloat = 0
    ) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = blur / 2.0
        layer.shadowPath = nil
        layer.masksToBounds = false
    }
}
