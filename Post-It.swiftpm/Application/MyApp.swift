import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
          NavigationView {
            WebtoonMainView()
          }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
