import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var favoriteManager: FavoriteManager
    @EnvironmentObject var userProfile: UserProfile
    @State private var selectedGenre: String = "All"
    
    private let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("Welcome back username!")
                            .font(AppFont.regular(size: 19))
                            .foregroundColor(Color("EntryDescription"))
                        
                        Spacer()
                        
                        NavigationLink(destination: ProfileView()) {
                            if let avatar = userProfile.selectedAvatar {
                                Image(uiImage: avatar)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color("PrimaryRed"), lineWidth: 1))
                            } else {
                                Image("charlesdickens")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color("PrimaryRed"), lineWidth: 1))
                            }
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 90)
                    
                    Text("View and Mark these latest books!")
                        .font(AppFont.title(size: 25))
                        .padding(.leading, 20)
                        .padding(.top, 8)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 15) {
                            ForEach(BookData.latestBooks, id: \.title) { book in
                                NavigationLink(destination: BookView(book: book)
                                    .environmentObject(favoriteManager)) {
                                    BookItem(
                                        imageName: book.imageName,
                                        title: book.title,
                                        author: book.author,
                                        genre: book.genre
                                    )
                                }.buttonStyle(PressableButtonStyle())
                                
                            }
                        }
                        .padding(.leading, 20)
                        .padding(.top, 10)
                    }
                    
                    Text("Popular books")
                        .font(AppFont.title(size: 25))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 20)
                    
                    GenreSelector(selectedGenre: $selectedGenre)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(filteredPopularBooks(), id: \.title) { book in
                            NavigationLink(destination: BookView(book: book)
                                .environmentObject(favoriteManager)) {
                                BookItem2(
                                    imageName: book.imageName,
                                    title: book.title,
                                    author: book.author,
                                    genre: book.genre
                                )
                            }
                            .buttonStyle(PressableButtonStyle())
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                }
            }
            .ignoresSafeArea(edges: .top)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
    
    func filteredPopularBooks() -> [Book] {
        if selectedGenre == "All" {
            return BookData.popularBooks
        } else {
            return BookData.popularBooks.filter { $0.genre == selectedGenre }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(FavoriteManager())
        .environmentObject(UserProfile())
    
}
