//
//  ContentView.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    
    @State var currentOnboardingStep: OnboardingSteps = .firstStep
    
    var body: some View {
        if currentOnboardingStep != .finished {
            OnboardingView(currentOnboardingStep: $currentOnboardingStep)
                .task {
                    try? await Task.sleep(for: Duration.seconds(1))
                    self.launchScreenState.dismiss()
                }
        } else {
            Text("HomeView")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
