//
//  OnboardingStep.swift
//  TasteCraft
//
//  Created by Benedikt Geisberger on 18.11.23.
//

import SwiftUI
import WrappingHStack

struct OnboardingStep<Content: View>: View {
    @Binding var tagInput: [(label: String, isActive: Bool)]
    @Binding var input: String
    
    @ViewBuilder let image: Content
    
    let headerTitle: String
    let subtitle: String
    let buttonText: String
    
    var body: some View {
        VStack(spacing: 35.0) {
            VStack(spacing: 0) {
                image
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(headerTitle)
                        .font(.custom("Montserrat", size: 24).weight(.bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("Black"))
                        .frame(maxWidth: .infinity, alignment: .top)
                    
                    Text(subtitle)
                        .font(.custom("Montserrat", size: 12).weight(.semibold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("Grey"))
                        .frame(maxWidth: .infinity, alignment: .top)
                }
                .frame(width: 248, alignment: .bottomLeading)
            }
            
            WrappingHStack(tagInput, id: \.self, alignment: .center, spacing: .constant(10), lineSpacing: 10) { need in
                Tag(isActive: need.isActive, label: need.label)
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 0)
            .frame(width: 393, alignment: .center)
            
            TagInput(
                input: $input,
                onSubmit: {
                    tagInput.append((label: input, isActive: true))
                }
            )
            .padding(.horizontal, 80.0)
            
            Spacer()
            
            Button {
                // Ihre Logik hier
            } label: {
                Text(buttonText)
            }
            .buttonStyle(CustomButtonStyle())
            .padding(.horizontal, 30.0)
        }
    }
}

#Preview {
    struct Preview: View {
        @State var input = ""
        @State var dietaryNeeds: [(label: String, isActive: Bool)] = [
            ("Vegetarian", false),
            ("Vegan", false),
            ("Gluten-Free", false),
            ("Lactose-Free", false),
            ("Paleo", false),
            ("Keto", false),
            ("Diabetic-Friendly", false)
        ]
        
        @ViewBuilder
        var image: some View {
            Image("Whisk")
                .resizable()
                .scaledToFit()
                .frame(height: 200.0)
        }
        
        var body: some View {
            OnboardingStep(
                tagInput: $dietaryNeeds,
                input: $input,
                image: {
                    image
                },
                headerTitle: "Header",
                subtitle: "Descriptive Text",
                buttonText: "Continue"
            )
        }
    }

    return Preview()
}
