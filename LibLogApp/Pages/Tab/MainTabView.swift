import SwiftUI

struct MainTabView: View {
    @StateObject private var favoriteManager = FavoriteManager()
    @StateObject private var tabBarManager = TabBarManager()
    @StateObject private var userProfile = UserProfile()
    @State private var selectedIndex = 0
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Group {
                    switch selectedIndex {
                    case 0:
                        HomeView()
                            .onAppear { tabBarManager.isHidden = false }
                    case 1:
                        FavoriteView()
                            .onAppear { tabBarManager.isHidden = false }
                    case 2:
                        SearchView()
                            .onAppear { tabBarManager.isHidden = false }
                    default:
                        HomeView()
                            .onAppear { tabBarManager.isHidden = false }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                if !tabBarManager.isHidden {
                    HStack {
                        Spacer()
                        Button { selectedIndex = 0 } label: {
                            Image(systemName: "house")
                                .font(.system(size: 24))
                                .foregroundColor(selectedIndex == 0 ? Color("PrimaryRed") : Color.gray.opacity(0.6))
                        }
                        Spacer()
                        Button { selectedIndex = 1 } label: {
                            Image(systemName: selectedIndex == 1 ? "heart.fill" : "heart")
                                .font(.system(size: 24))
                                .foregroundColor(selectedIndex == 1 ? Color("PrimaryRed") : Color.gray.opacity(0.6))
                        }
                        Spacer()
                        Button { selectedIndex = 2 } label: {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 24))
                                .foregroundColor(selectedIndex == 2 ? Color("PrimaryRed") : Color.gray.opacity(0.6))
                        }
                        Spacer()
                    }
                    .padding(.vertical, 12)
                    .frame(height: 54)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .shadow(radius: 2)
                    )
                    .padding(.horizontal, 12)
                }
            }
        }
    }
}

#Preview {
    MainTabView()
}
