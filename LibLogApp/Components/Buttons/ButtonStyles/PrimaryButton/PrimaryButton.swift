import SwiftUI

struct PrimaryButton: View {
    var title: String
    var action: () -> Void
    var isEnabled: Bool = true
    
    var body: some View {
        Button(action: {
            if isEnabled { action() }
        }) {
            Text(title)
                .font(AppFont.title(size: 18))
                .foregroundColor(.white)
                .frame(width: 220, height: 55)
                .background(isEnabled ? Color("PrimaryRed") : Color.gray.opacity(0.5))
                .cornerRadius(10)
        }
        .disabled(!isEnabled)
    }
}
