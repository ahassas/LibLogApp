import SwiftUI

struct RegisterView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var navigateToEntry = false
    @State private var attempted = false
    
    @AppStorage("savedUsername") private var savedUsername = ""
    @AppStorage("savedPassword") private var savedPassword = ""
    
    private var usernameValid: Bool {
        !username.isEmpty && username.count >= 3
    }
    private var passwordValid: Bool {
        password.count >= 6 &&
        password.count <= 12 &&
        password.rangeOfCharacter(from: .decimalDigits) != nil
    }
    private var passwordsMatch: Bool {
        password == confirmPassword && !confirmPassword.isEmpty
    }
    
    private var allValid: Bool {
        usernameValid && passwordValid && passwordsMatch
    }
    
    private var allFieldsFilled: Bool {
        !username.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Circle()
                    .fill(Color("RegisterBrown"))
                    .frame(width: 640, height: 640)
                    .padding(.bottom, 650)
                
                Image("RegisterImage")
                    .resizable()
                    .frame(width: 380, height: 450)
                    .padding(.bottom, 410)
                
                VStack(alignment: .center, spacing: 8) {
                    Spacer().frame(height: 300)
                    
                    Text("Create Account")
                        .font(AppFont.title(size: 25))
                    
                    VStack(alignment: .leading, spacing: 2) {
                        TextField("Username", text: $username)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .textContentType(.none)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(attempted && !usernameValid ? Color.red : Color.clear, lineWidth: 2)
                            )
                        
                        if attempted && !usernameValid {
                            Text("Username must be at least 3 characters")
                                .font(.caption)
                                .foregroundColor(.red)
                                .padding(.leading, 5)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        SecureField("Password", text: $password)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .textContentType(.none)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(attempted && !passwordValid ? Color.red : Color.clear, lineWidth: 2)
                            )
                        
                        if attempted && !passwordValid {
                            Text("Password must be 6-12 chars & include a number")
                                .font(.caption)
                                .foregroundColor(.red)
                                .padding(.leading, 5)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        SecureField("Confirm Password", text: $confirmPassword)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(attempted && !passwordsMatch ? Color.red : Color.clear, lineWidth: 2)
                            )
                        
                        if attempted && !passwordsMatch {
                            Text("Passwords do not match")
                                .font(.caption)
                                .foregroundColor(.red)
                                .padding(.leading, 5)
                        }
                    }
                    
                    if attempted && !allValid {
                        Text("Please fix the errors above before continuing")
                            .font(.caption)
                            .foregroundColor(.red)
                            .padding(.top, 4)
                    }
                    
                    NavigationLink("", destination: EntryView(), isActive: $navigateToEntry)
                        .hidden()
                    
                    PrimaryButton(
                        title: "Register",
                        action: {
                            attempted = true
                            if allValid {
                                savedUsername = username
                                savedPassword = password
                                navigateToEntry = true
                            }
                        },
                        isEnabled: allFieldsFilled
                    )
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .padding(.top, 360)
            }
        }
        .withCustomBackButton()
    }
}

#Preview {
    RegisterView()
}
