import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    @EnvironmentObject var tabBarManager: TabBarManager
    @EnvironmentObject var userProfile: UserProfile
    @State private var selectedIndex = 0
    
    var body: some View {
            VStack(spacing: 0) {
                Group {
                    switch selectedIndex {
                          case 0: HomeView()
                          case 1: FavoriteView()
                          case 2: SearchView()
                          default: HomeView()
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
                            Image(systemName: "bookmark")
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

    #Preview {
        MainTabView()
            .environmentObject(FavoriteManager())
            .environmentObject(TabBarManager())
            .environmentObject(UserProfile())
    }
