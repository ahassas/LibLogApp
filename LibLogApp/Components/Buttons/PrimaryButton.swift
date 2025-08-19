import SwiftUI

struct PrimaryButton<Destination: View>: View {
    
    var title: String
    var destination: Destination
  
    
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(AppFont.title(size: 18))
                .foregroundColor(.white)
                .frame(width: 220, height: 55)
                .background(Color("PrimaryRed"))
                .cornerRadius(10)
        }
       
        
    }
}


// PrimaryButton(title: "Log In", destination: LoginView())
