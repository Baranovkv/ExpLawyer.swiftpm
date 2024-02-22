import SwiftUI
import TipKit

@main
struct MyApp: App {
    @StateObject var gameVM = GameVM()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(gameVM)
        }
    }
    
    init() {
        do {
            try Tips.resetDatastore()
            try Tips.configure()
        } catch {
            print(error)
        }
    }
}
