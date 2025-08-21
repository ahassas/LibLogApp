import SwiftUI
import PhotosUI

struct ProfileView: View {
    @State private var tempSelectedAvatar: UIImage? = nil
    @State private var showPhotoPicker = false
    @State private var selectedItem: PhotosPickerItem? = nil
    
    @EnvironmentObject var tabBarManager: TabBarManager
    @EnvironmentObject var userProfile: UserProfile
    
    @AppStorage("isLoggedIn") private var isLoggedIn = true
    
    @Environment(\.dismiss) private var dismiss
    
    private let exampleAvatars = ["charlesdickens","henryjames","janeausten","shakespeare","virginiawoolf"]
    private let avatarNames = ["Charles Dickens","Henry James","Jane Austen","Shakespeare","Virginia Woolf"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                
                Text("Pick an Avatar")
                    .font(AppFont.title(size: 28))
                    .foregroundColor(Color("PrimaryRed"))
                    .padding(.vertical, 10)
                
                Text("Choose from our classic authors or upload your own photo.")
                    .font(AppFont.regular(size: 16))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                Image(uiImage: tempSelectedAvatar ?? userProfile.selectedAvatar ?? UIImage(named: "charlesdickens")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color("PrimaryRed"), lineWidth: 3))
                    .shadow(radius: 5)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 20) {
                    ForEach(0..<exampleAvatars.count, id: \.self) { index in
                        VStack(spacing: 8) {
                            Button {
                                tempSelectedAvatar = UIImage(named: exampleAvatars[index])
                            } label: {
                                Image(exampleAvatars[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color("PrimaryRed"), lineWidth: tempSelectedAvatar == UIImage(named: exampleAvatars[index]) ? 2 : 0))
                                    .shadow(radius: 3)
                            }
                            Text(avatarNames[index])
                                .font(AppFont.regular(size: 13))
                                .foregroundColor(.primary)
                        }
                    }
                    
                    VStack(spacing: 8) {
                        Button {
                            showPhotoPicker = true
                        } label: {
                            ZStack {
                                Circle().fill(Color.gray.opacity(0.2)).frame(width: 70, height: 70)
                                Image(systemName: "plus").font(.system(size: 28, weight: .bold)).foregroundColor(Color("PrimaryRed"))
                            }
                        }
                        Text("Custom").font(AppFont.regular(size: 13)).foregroundColor(.primary)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 20)
                
                Spacer()
                
                PrimaryButton(title: "Save") {
                    if let avatar = tempSelectedAvatar {
                        userProfile.selectedAvatar = avatar
                        self.dismiss()
                    }
                }
                .padding(.bottom, 50)
                .padding(.top, 40)
                .photosPicker(isPresented: $showPhotoPicker, selection: $selectedItem, matching: .images)
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            tempSelectedAvatar = uiImage
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        CustomBackButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        LogoutButton(logoutAction: {
                            userProfile.selectedAvatar = nil
                            isLoggedIn = false
                        })
                    }
                }
                .onAppear { tabBarManager.isHidden = true }
                .onDisappear { tabBarManager.isHidden = false }
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(TabBarManager())
        .environmentObject(FavoriteManager())
        .environmentObject(UserProfile())
}
