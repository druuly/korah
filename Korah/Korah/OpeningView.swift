import SwiftUI

struct OpeningView: View {
    @State private var fadeIn = false // Animation trigger
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Welcome to Korah")
                        .font(.system(size: 36, weight: .semibold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .opacity(fadeIn ? 1 : 0)
                        .animation(.easeIn(duration: 1).delay(0.2), value: fadeIn)
                    
                    Text("Your very own focus-buddy.")
                        .font(.system(size: 20))
                        .foregroundColor(.purple)
                        .opacity(fadeIn ? 1 : 0)
                        .animation(.easeIn(duration: 1).delay(0.5), value: fadeIn)
                    
                    NavigationLink(destination: CreateAccountView()) {
                        Text("Get Started")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(12)
                            .padding(.horizontal, 40)
                    }
                    .opacity(fadeIn ? 1 : 0)
                    .animation(.easeIn(duration: 1).delay(0.8), value: fadeIn)
                }
                .frame(maxHeight: .infinity)
                .padding()
                .onAppear {
                    fadeIn = true
                }
            }
        }
    }
}

struct OpeningView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningView()
    }
}
