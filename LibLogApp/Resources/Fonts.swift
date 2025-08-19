import SwiftUI

enum AppFont {
    static func title(size: CGFloat) -> Font {
        .custom("AvenirNext-DemiBold", size: size)
    }
    static func regular(size: CGFloat) -> Font {
        .custom("AvenirNext-Regular", size: size)
    }
}
// .font(AppFont.title(size: 25))
