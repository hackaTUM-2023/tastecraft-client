//
//  OnboardingView.swift
//  TasteCraft
//
//  Created by Benedikt Geisberger on 18.11.23.
//

import SwiftUI
import WrappingHStack

enum OnboardingSteps {
    case firstStep
    case secondStep
    case finished
}

struct OnboardingView: View {
    @Binding var currentOnboardingStep: OnboardingSteps
    @State var dietaryNeeds: [(label: String, isActive: Bool)] = [
        ("Vegetarian", false),
        ("Vegan", false),
        ("Gluten-Free", false),
        ("Lactose-Free", false),
        ("Paleo", false),
        ("Keto", false),
        ("Diabetic-Friendly", false)
    ]
    @State var unwantedIngredients: [(label: String, isActive: Bool)] = [
        ("Nuts", false),
        ("Soy", false),
        ("Seafood", false),
        ("Sesame", false),
        ("Mustard", false),
        ("Sulfites", false),
        ("Tomatos", false)
    ]
    @State var input: String = ""
    
    @ViewBuilder
    private var image1: some View {
        Image("Whisk")
            .resizable()
            .scaledToFit()
            .frame(height: 200.0)
    }
    
    @ViewBuilder
    private var image2: some View {
        Image("ThumbsDown")
            .resizable()
            .scaledToFit()
            .frame(height: 140.0)
            .padding(.vertical, 32.0)
    }
    
    var body: some View {
        if currentOnboardingStep == OnboardingSteps.firstStep {
            OnboardingStep(
                tagInput: $dietaryNeeds,
                input: $input,
                image: {
                    image1
                },
                headerTitle: "Craft your culinary experience!",
                subtitle: "Please select your dietary needs",
                buttonText: "Continue",
                onClick: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        input = ""
                        currentOnboardingStep = .secondStep
                    }
                }
            ).transition(.push(from: .trailing))
        } else {
            OnboardingStep(
                tagInput: $unwantedIngredients,
                input: $input,
                image: {
                    image2
                },
                headerTitle: "Select Your Ingredients Wisely!",
                subtitle: "Choose the ingredients you want to avoid",
                buttonText: "Create My Flavor World",
                onClick: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        input = ""
                        currentOnboardingStep = .finished
                    }
                }
            ).transition(.push(from: .trailing))
        }
    }
}

#Preview {
    struct Preview: View {
        @State var currentOnboardingStep: OnboardingSteps = .firstStep
        
        var body: some View {
            OnboardingView(currentOnboardingStep: $currentOnboardingStep)
        }
    }

    return Preview()
}
