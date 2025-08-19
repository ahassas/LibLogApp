import SwiftUI

struct CustomBackButton: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .resizable()
                .frame(width: 12, height: 20)
                .foregroundColor(.black)
        }
    }
}
