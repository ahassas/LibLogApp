import SwiftUI

struct SearchView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    
    @State private var searchText = ""
    @State private var selectedGenre = "All"
    
    private let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var filteredBooks: [Book] {
        guard searchText.count >= 3 else { return [] }
        
        let filteredByGenre = selectedGenre == "All" ? BookData.allBooks : BookData.allBooks.filter { $0.genre == selectedGenre }
        
        return filteredByGenre.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                TextField("Search books...", text: $searchText, onCommit: {
                   
                })
                .padding(10)
                .padding(.horizontal, 30)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        Spacer()
                        if !searchText.isEmpty {
                            Button(action: {
                                searchText = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                
                GenreSelector(selectedGenre: $selectedGenre)
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                
                Divider()
                    .padding(.vertical, 10)
                
                if searchText.count < 3 {
                    VStack(spacing: 15) {
                        
                        Spacer()
                            .frame(height: 70)
                
                        Image("lamp")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180, height: 180)
                            .foregroundColor(.gray.opacity(0.5))
                        Text("Please enter at least 3 characters to search")
                            .font(AppFont.regular(size: 16))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                            
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                else if filteredBooks.isEmpty {
                    VStack(spacing: 15) {
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray.opacity(0.5))
                        Text("No books found")
                            .font(AppFont.title(size: 20))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(filteredBooks) { book in
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
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
        SearchView()
            .environmentObject(FavoriteManager())
    }

