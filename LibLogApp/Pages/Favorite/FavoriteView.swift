import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    @State private var selectedGenre: String = "All"

    private let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Your Favorite Books")
                        .font(AppFont.title(size: 30))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 120)
                    
                    GenreSelector(selectedGenre: $selectedGenre)
                        .padding(.top, 30)
                    
                    if filteredFavoriteBooks.isEmpty {
                        VStack {
                            Spacer()
                            
                            Text(selectedGenre == "All" ? "No favorites yet" : "No favorites in \(selectedGenre)")
                                .font(AppFont.title(size: 29))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                            
                            Text(selectedGenre == "All" ? "Mark some books as favorite to see them here!" : "Try selecting a different genre or add some \(selectedGenre) books to favorites!")
                                .font(AppFont.regular(size: 16))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.top, 5)
                                .padding(.horizontal, 40)
                            
                            Spacer()
                                .frame(height: 100)
                        }
                        .frame(maxWidth: .infinity)
                    } else {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(filteredFavoriteBooks) { book in
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
                        .padding(.top, 20)
                    }
                    
                    Spacer(minLength: 50)
                    
                    
                    HStack {
                        Image("catImage")
                            .resizable()
                            .frame(width: 200, height: 200, alignment: .leading)
                        
                        Text("A reader lives a thousand lives before he dies. The man who never reads lives only one. \n— George R.R. Martin")
                            .font(AppFont.regular(size: 14))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.trailing, 20)
                    }
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .frame(minHeight: UIScreen.main.bounds.height)
            }
            .ignoresSafeArea(edges: .top)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }

    private var favoriteBooks: [Book] {
        BookData.allBooks.filter { favoriteManager.isFavorite(book: $0) }
    }
    
    private var filteredFavoriteBooks: [Book] {
        if selectedGenre == "All" {
            return favoriteBooks
        } else {
            return favoriteBooks.filter { $0.genre == selectedGenre }
        }
    }
}

#Preview {
    FavoriteView()
        .environmentObject(FavoriteManager())
}
