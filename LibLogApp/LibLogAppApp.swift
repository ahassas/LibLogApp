import SwiftUI

@main
struct MyApp: App {
    @StateObject private var favoriteManager = FavoriteManager()
    @StateObject private var tabBarManager = TabBarManager()
    @StateObject private var userProfile = UserProfile()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                EntryView()
            }
            .environmentObject(favoriteManager)
            .environmentObject(tabBarManager)
            .environmentObject(userProfile)
        }
    }
}
