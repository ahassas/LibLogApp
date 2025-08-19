
import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    var book: Book

    var body: some View {
        Button {
            favoriteManager.toggleFavorite(book: book)
        } label: {
            Image(favoriteManager.isFavorite(book: book) ? "savedFill" : "savedEmpty")
                .resizable()
                .frame(width: 19, height: 24)
                .foregroundColor(favoriteManager.isFavorite(book: book) ? Color("PrimaryRed") : .gray)
        }
    }
}
