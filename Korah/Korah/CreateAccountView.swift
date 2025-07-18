import SwiftUI

struct CreateAccountView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Create Account")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                
                // Username Field
                TextField("Username", text: $username)
                    .keyboardType(.default) // 👈 Applied before modifiers
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                
                // Email Field
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress) // 👈 Fix here
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                
                // Password Field
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                
                // Create Account Button
                Button(action: {
                    // Handle account creation logic
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
            }
            .padding()
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
