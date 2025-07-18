/* 
 
 */

import SwiftUI

struct CreateAccountView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @AppStorage("IsLoggedIn") private var isLoggedIn: Bool = false
    @AppStorage("SavedUsername") private var savedUsername: String = ""
    
    @State private var navigateToHome = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Create Account")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                
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
                
                Button(action: {
                    // Save to database
                    UserDatabaseManager.saveUser(email: email, username: username)
                    savedUsername = username
                    isLoggedIn = true
                    navigateToHome = true
                }) {
                    Text("Create Account")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(12)
                        .padding(.horizontal, 40)
                }
                .disabled(username.isEmpty || email.isEmpty || password.isEmpty)
                .opacity((username.isEmpty || email.isEmpty || password.isEmpty) ? 0.5 : 1.0)
                
                Spacer()
            }
            .padding()
            .fullScreenCover(isPresented: $navigateToHome) {
                HomePageView(username: username)
            }
        }
    }
}
