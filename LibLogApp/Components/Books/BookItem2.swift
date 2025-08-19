import SwiftUI

struct BookItem2: View {
    var imageName: String
    var title: String
    var author: String
    var genre: String
    var imageToTitleSpacing: CGFloat = 8
    var titleToAuthorSpacing: CGFloat = 5
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .frame(width: 172, height: 268)
                .cornerRadius(20)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
                .frame(height: imageToTitleSpacing)
            
            Text(title)
                .font(AppFont.title(size: 20))
            
            Spacer()
                .frame(height: titleToAuthorSpacing)
            
            Text(author)
                .font(AppFont.regular(size: 16))
                .foregroundColor(Color("EntryDescription"))
        }
    }
}
