import SwiftUI

struct BookView: View {
    var book: Book
    @EnvironmentObject var favoriteManager: FavoriteManager
    @EnvironmentObject var tabBarManager: TabBarManager

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    Image(book.imageName)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .frame(width: 200, height: 300)
                        .cornerRadius(10)
                        .shadow(radius: 4)

                    VStack(spacing: 6) {
                        Text(book.title)
                            .font(AppFont.title(size: 24))
                            .multilineTextAlignment(.center)
                        Text("by \(book.author)")
                            .font(AppFont.regular(size: 18))
                            .foregroundColor(.gray)
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        infoRow(label: "Genre:", value: book.genre)
                        infoRow(label: "Category:", value: book.category)
                        infoRow(label: "Publisher:", value: book.publisher)
                        infoRow(label: "Language:", value: book.language)
                        infoRow(label: "Pages:", value: "\(book.pageCount)")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 7)

                    VStack(alignment: .leading, spacing: 6) {
                        Text("Description")
                            .font(AppFont.title(size: 25))
                        Text(book.description)
                            .font(AppFont.regular(size: 15))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)

                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 15)
            }
        }.environmentObject(TabBarManager())
        
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                FavoriteButton(book: book)
                    .padding(.trailing, 3)
            }
        }
        .onAppear { tabBarManager.isHidden = true }
        .onDisappear { tabBarManager.isHidden = false }
    }

    @ViewBuilder
    private func infoRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .font(AppFont.title(size: 16))
                .foregroundColor(.red)
            Text(value)
                .font(AppFont.regular(size: 16))
                .foregroundColor(.black)
        }
    }
}

#Preview {
    BookView(book: Book(
        id: UUID().uuidString,
        imageName: "catcherintherye",
        title: "Catcher in the Rye",
        author: "J.D. Salinger",
        genre: "Novel",
        description: "The Catcher in the Rye is a story about teenage rebellion and alienation, following Holden Caulfield as he navigates the challenges of identity, belonging, and the adult world.",
        pageCount: 277,
        category: "Classic Literature",
        publisher: "Little, Brown and Company",
        language: "English"
    ))
    .environmentObject(FavoriteManager())
    .environmentObject(TabBarManager())
}
