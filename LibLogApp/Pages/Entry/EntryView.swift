import SwiftUI

struct EntryView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    @EnvironmentObject var tabBarManager: TabBarManager
    @EnvironmentObject var userProfile: UserProfile

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 57)
                
                Image("StartImage")
                    .resizable()
                    .frame(width: 428, height: 430)
                
                Spacer()
                    .frame(height: 26)
                
                Image("slidebar")
                    .resizable()
                    .frame(width: 64, height: 6)
                
                Spacer()
                    .frame(height: 28)
                
                Text("LibLog, your own digital library")
                    .font(AppFont.title(size: 20))
                
                Spacer()
                    .frame(height: 10)
                
                Text("Organize your books by genre, save them to your collection, mark favourites and rate each one. All in one app!")
                    .font(AppFont.regular(size: 16))
                    .foregroundColor(Color("EntryDescription"))
                    .frame(width: 320, height: 70)
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 4)
                
                PrimaryButton(title: "Log In", destination: LoginView())
                    .padding(.top, 30)
                
                SecondaryButton(title: "Sign Up", destination: RegisterView())
                    .padding(.top, 15)
                
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    EntryView()
        .environmentObject(FavoriteManager())
        .environmentObject(TabBarManager())
        .environmentObject(UserProfile())
}
