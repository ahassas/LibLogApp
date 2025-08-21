import SwiftUI

struct LogoutButton: View {
    @State private var showAlert = false
    @State private var goToLogin = false
    
    var logoutAction: () -> Void
    
    var body: some View {
        Button {
            showAlert = true
        } label: {
            Image(systemName: "rectangle.portrait.and.arrow.right")
                .foregroundColor(.red)
        }
        .alert("Are you sure you want to log out?", isPresented: $showAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Logout", role: .destructive) {
                logoutAction()
                goToLogin = true
            }
        }
        .fullScreenCover(isPresented: $goToLogin) {
            EntryView()
                .navigationBarBackButtonHidden(true)
        }
    }
}
