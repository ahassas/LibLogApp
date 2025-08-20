import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    var book: Book

    var body: some View {
        Button {
            favoriteManager.toggleFavorite(book: book)
        } label: {
            Image(systemName: favoriteManager.isFavorite(book: book) ? "heart.fill" : "heart")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 30)
                .foregroundColor(favoriteManager.isFavorite(book: book) ? Color("PrimaryRed") : .gray)
        }
    }
}
