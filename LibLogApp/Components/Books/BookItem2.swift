import SwiftUI

struct BookItem2: View {
    var imageName: String
    var title: String
    var author: String
    var genre: String
    var imageToTitleSpacing: CGFloat = 8
    var titleToAuthorSpacing: CGFloat = 5
    
    private var adjustedTitle: String {
        if title.count > 34 {
            let index = title.index(title.startIndex, offsetBy: 34)
            return String(title[..<index]) + "..."
        } else if title.count <= 17 {
            return title.padding(toLength: 17, withPad: " ", startingAt: 0)
        } else {
            return title
        }
    }
    
    private var needsExtraEmptyLine: Bool {
        return title.count <= 17
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(imageName)
                .resizable()
                .frame(width: 172, height: 268)
                .cornerRadius(20)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer().frame(height: imageToTitleSpacing)
            
            Text(adjustedTitle)
                .font(AppFont.title(size: 20))
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer().frame(height: titleToAuthorSpacing)
            
            Text(author)
                .font(AppFont.regular(size: 16))
                .foregroundColor(Color("EntryDescription"))
            
            if needsExtraEmptyLine {
                Text(" ")
                    .font(AppFont.title(size: 20))
            }
        }
    }
}
