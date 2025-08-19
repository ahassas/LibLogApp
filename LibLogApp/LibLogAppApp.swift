import SwiftUI

@main
struct MyApp: App {
    @StateObject private var favoriteManager = FavoriteManager()
   
    var body: some Scene {
        WindowGroup {
            EntryView()
                .environmentObject(favoriteManager)
                .environmentObject(TabBarManager())
                .environmentObject(UserProfile())
        }
    }
}
