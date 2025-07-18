import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @AppStorage("IsLoggedIn") private var isLoggedIn: Bool = false
    @AppStorage("SavedUsername") private var savedUsername: String = ""
    
    @State private var navigateToHome = false
    @State private var loginError: String?
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Log In")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .keyboardType(.emailAddress)
                    .padding(.horizontal, 40)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                
                if let error = loginError {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.system(size: 14, weight: .medium))
                }
                
                Button(action: {
                    if let username = UserDatabaseManager.getUsername(for: email) {
                        savedUsername = username
                        isLoggedIn = true
                        navigateToHome = true
                    } else {
                        loginError = "No account found for this email."
                    }
                }) {
                    Text("Log In")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(12)
                        .padding(.horizontal, 40)
                }
                .disabled(email.isEmpty || password.isEmpty)
                .opacity((email.isEmpty || password.isEmpty) ? 0.5 : 1.0)
                
                Spacer()
            }
            .padding()
            .fullScreenCover(isPresented: $navigateToHome) {
                HomePageView(username: savedUsername)
            }
        }
    }
}
