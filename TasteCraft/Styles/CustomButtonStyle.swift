//
//  CustomButton.swift
//  TasteCraft
//
//  Created by Benedikt Geisberger on 18.11.23.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .labelStyle(.titleOnly)
            .padding(.horizontal, 15)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("HelloFresh Green Light"))
            .foregroundColor(Color("Black"))
            .font(.custom("Montserrat", size: 16).weight(.bold))
            .cornerRadius(50)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
