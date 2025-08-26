import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var navigateToHome = false
    @State private var attempted = false
    @State private var errorMessage = ""
    
    @AppStorage("savedUsername") private var savedUsername = ""
    @AppStorage("savedPassword") private var savedPassword = ""
    
    private var loginValid: Bool {
        !username.isEmpty && !password.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Circle()
                    .fill(Color("LoginBlue"))
                    .frame(width: 640, height: 640)
                    .padding(.bottom, 650)
                
                Image("LoginImage")
                    .resizable()
                    .frame(width: 380, height: 346)
                    .padding(.bottom, 410)
                
                VStack {
                    Spacer().frame(height: 200)
                    
                    Text("Welcome to LibLog!")
                        .font(AppFont.title(size: 25))
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .textContentType(.none)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(attempted && username.isEmpty ? Color.red : Color.clear, lineWidth: 2)
                        )

                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .textContentType(.none)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(attempted && password.isEmpty ? Color.red : Color.clear, lineWidth: 2)
                        )
                    
                    if attempted && !errorMessage.isEmpty {
                        Text(errorMessage)
                            .font(.caption)
                            .foregroundColor(.red)
                            .padding(.top, 4)
                    }
                    
                    NavigationLink("", destination: MainTabView(), isActive: $navigateToHome)
                        .hidden()
                    
                    PrimaryButton(title: "Sign In", action: {
                        attempted = true
                        
                        if !loginValid {
                            errorMessage = "Please fill in all fields"
                        }
                        else if (username == "Admin1" && password == "Admin1") || (username == savedUsername && password == savedPassword) {
                            errorMessage = ""
                            navigateToHome = true
                        }
                        else {
                            errorMessage = "Invalid username or password"
                        }
                    }, isEnabled: loginValid)
                    .padding(.top, 30)
                    
                    Spacer()
                }
                .padding(.top, 460)
            }
        }
        .withCustomBackButton()
    }
}

#Preview {
    LoginView()
}
