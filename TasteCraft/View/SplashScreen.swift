//
//  SplashScreen.swift
//  TasteCraft
//
//  Created by Benedikt Geisberger on 18.11.23.
//

import SwiftUI

struct SplashScreen: View {
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager

    @State private var firstAnimation = false
    @State private var secondAnimation = false
    @State private var startFadeoutAnimation = false
    
    @ViewBuilder
    private var logo: some View {
        Image("TasteCraft-Logo")
            .resizable()
            .scaledToFit()
            .frame(height: 175.0)
    }
    
    @ViewBuilder
    private var backgroundColor: some View {
        Color.white.ignoresSafeArea()
    }
    
    private let animationTimer = Timer
        .publish(every: 0.5, on: .current, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            backgroundColor
            VStack(spacing: 35.0) {
                logo
                VStack {
                    Text("Welcome to")
                    Text("TasteCraft")
                        .foregroundColor(Color("HelloFresh Green Dark"))
                }
                .font(
                    Font
                        .custom("Montserrat-Bold", size: 40)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color("Black"))
                .frame(maxWidth: .infinity, alignment: .top)
            }
            .onReceive(animationTimer) { timerValue in
                updateAnimation()
            }
        .opacity(startFadeoutAnimation ? 0 : 1)
        }
    }
    
    private func updateAnimation() {
        switch launchScreenState.state {
        case .firstStep:
            withAnimation(.easeInOut(duration: 0.9)) {
                firstAnimation.toggle()
            }
        case .secondStep:
            if secondAnimation == false {
                withAnimation(.linear) {
                    self.secondAnimation = true
                    startFadeoutAnimation = true
                }
            }
        case .finished:
            break
        }
    }
    
}

#Preview {
    SplashScreen()
}
