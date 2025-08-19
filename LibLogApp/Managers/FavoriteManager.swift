
import SwiftUI

class FavoriteManager: ObservableObject {
    @AppStorage("favoriteBookIDs") private var storedIDs: String = ""
    @Published private(set) var favoriteBookIDs: Set<String> = []

    init() {
        loadFavorites()
    }

    func loadFavorites() {
        let ids = storedIDs.split(separator: ",").map(String.init)
        favoriteBookIDs = Set(ids)
    }

    func isFavorite(book: Book) -> Bool {
        favoriteBookIDs.contains(book.id)
    }

    func toggleFavorite(book: Book) {
        if isFavorite(book: book) {
            favoriteBookIDs.remove(book.id)
        } else {
            favoriteBookIDs.insert(book.id)
        }
        storedIDs = favoriteBookIDs.sorted().joined(separator: ",")
    }
}
