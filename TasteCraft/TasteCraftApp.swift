//
//  TasteCraftApp.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.23.
//

import SwiftUI

@main
struct TasteCraftApp: App {
    @StateObject var launchScreenState = LaunchScreenStateManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                
                if launchScreenState.state != .finished {
                    SplashScreen()
                }
            }
            .environmentObject(launchScreenState)
        }
    }
}
