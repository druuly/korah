import SwiftUI

struct HomePageView: View {
    var username: String
    @State private var selectedTab: Tab = .home // Track active tab
    
    enum Tab {
        case home, tasks, chatbot, settings
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                // Main content area
                Group {
                    switch selectedTab {
                    case .home:
                        homeContent
                    case .tasks:
                        tasksContent
                    case .chatbot:
                        chatbotContent
                    case .settings:
                        settingsContent
                    }
                }
                .frame(maxHeight: .infinity)
                
                // Bottom Nav Bar
                HStack {
                    navBarButton(icon: "house.fill", tab: .home)
                    Spacer()
                    navBarButton(icon: "checkmark.square.fill", tab: .tasks)
                    Spacer()
                    navBarButton(icon: "bubble.left.and.bubble.right.fill", tab: .chatbot)
                    Spacer()
                    navBarButton(icon: "gearshape.fill", tab: .settings)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
                .background(Color.white.opacity(0.1).blur(radius: 10))
                .cornerRadius(20)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            }
        }
    }
    
    // MARK: - Nav Bar Button
    private func navBarButton(icon: String, tab: Tab) -> some View {
        Button(action: {
            selectedTab = tab
        }) {
            Image(systemName: icon)
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(selectedTab == tab ? .purple : .white.opacity(0.7))
        }
    }
    
    // MARK: - Tab Contents
    private var homeContent: some View {
        VStack(spacing: 10) {
            Text("Welcome, \(username) 👋")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
            
            Text("This is your Home Screen")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(Color.purple)
        }
    }
    
    private var tasksContent: some View {
        VStack(spacing: 10) {
            Text("Tasks 📝")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
            
            Text("Here you can view and manage your to-dos.")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(Color.purple)
        }
    }
    
    private var chatbotContent: some View {
        VStack(spacing: 10) {
            Text("Korah Chatbot 🤖")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
            
            Text("Ask me anything, I'm here to help!")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(Color.purple)
        }
    }
    
    private var settingsContent: some View {
        VStack(spacing: 10) {
            Text("Settings ⚙️")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
            
            Text("Customize your app experience.")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(Color.purple)
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(username: "Oscar")
    }
}
