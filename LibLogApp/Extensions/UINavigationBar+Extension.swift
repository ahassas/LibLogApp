import UIKit

extension UINavigationBar {
    func removeBottomLine() {
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
        isTranslucent = false
    }
}
