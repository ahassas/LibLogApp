import SwiftUI

struct SecondaryButton<Destination: View>: View {
    var title: String
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(AppFont.title(size: 16))
                .foregroundColor(.white)
                .frame(width: 160, height: 45)
                .background(Color("PrimaryRed"))
                .cornerRadius(8)
        }
    }
}

// SecondaryButton(title: "Sign Up", destination: RegisterView())

