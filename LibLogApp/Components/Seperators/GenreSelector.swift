import SwiftUI

struct GenreSelector: View {
    @Binding var selectedGenre: String
    
    private let genres = ["All", "Novel", "Science Fiction", "Romance", "Crime", "History", "Fantasy"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(genres, id: \.self) { genre in
                    Button(action: {
                        selectedGenre = genre
                    }) {
                        Text(genre)
                            .font(AppFont.regular(size: 14))
                            .foregroundColor(selectedGenre == genre ? Color("PrimaryRed") : Color("EntryDescription"))
                            .padding(.bottom, 4)
                            .overlay(
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(selectedGenre == genre ? Color("PrimaryRed") : .clear),
                                alignment: .bottom
                            )
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
        }
    }
}

