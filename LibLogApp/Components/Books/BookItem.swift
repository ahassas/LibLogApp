import SwiftUI

struct BookItem: View {
    var imageName: String
    var title: String
    var author: String
    var genre: String
    var imageToTitleSpacing: CGFloat = 6
    var titleToAuthorSpacing: CGFloat = 4
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .cornerRadius(20)
                .frame(width: 160, height: 250)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
                .frame(height: imageToTitleSpacing)
            
            Text(title)
                .font(AppFont.title(size: 18))
            
            Spacer()
                .frame(height: titleToAuthorSpacing)
            
            Text(author)
                .font(AppFont.regular(size: 14))
                .foregroundColor(Color("EntryDescription"))
        }
    }
}

