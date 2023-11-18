//
//  OnboardingView.swift
//  TasteCraft
//
//  Created by Benedikt Geisberger on 18.11.23.
//

import SwiftUI
import WrappingHStack

struct OnboardingView: View {
    @State var dietaryNeeds: [(label: String, isActive: Bool)] = [
        ("Vegetarian", false),
        ("Vegan", false),
        ("Gluten-Free", false),
        ("Lactose-Free", false),
        ("Paleo", false),
        ("Keto", false),
        ("Diabetic-Friendly", false)
    ]
    @State var input: String = ""
    
    @ViewBuilder
    private var image: some View {
        Image("Whisk")
            .resizable()
            .scaledToFit()
            .frame(height: 200.0)
    }
    
    var body: some View {
        VStack(spacing: 35.0) {
            VStack(spacing: 0) {
                image
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Craft your culinary experience!")
                        .font(
                            Font.custom("Montserrat", size: 24)
                                .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("Black"))
                        .frame(maxWidth: .infinity, alignment: .top)
                    
                    Text("Please select your dietary needs")
                        .font(
                            Font.custom("Montserrat", size: 12)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("Grey"))
                        .frame(maxWidth: .infinity, alignment: .top)
                }
                .frame(width: 248, alignment: .bottomLeading)
            }
            
            
            WrappingHStack(dietaryNeeds, id: \.self, alignment: .center, spacing: .constant(10), lineSpacing: 10) { need in
                Tag(isActive: need.isActive, label: need.label)
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 0)
            .frame(width: 393, alignment: .center)
            
            TagInput(
                input: $input,
                onSubmit: {
                    dietaryNeeds.append((label: input, isActive: true))
                }
            )
            .padding(.horizontal, 80.0)
            
            Spacer()
            
            Button {
               
            } label: {
                Text("Continue")
            }
            .buttonStyle(CustomButtonStyle())
            .padding(.horizontal, 30.0)
        }
    }
}

#Preview {
    OnboardingView()
}
