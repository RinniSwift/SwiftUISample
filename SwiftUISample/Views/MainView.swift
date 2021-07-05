import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
            Settings()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}
