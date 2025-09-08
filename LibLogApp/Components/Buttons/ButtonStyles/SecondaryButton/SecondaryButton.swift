import SwiftUI

struct SecondaryButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(AppFont.title(size: 16))
                .foregroundColor(.white)
                .frame(width: 160, height: 45)
                .background(Color("PrimaryRed"))
                .cornerRadius(8)
        }
    }
}
