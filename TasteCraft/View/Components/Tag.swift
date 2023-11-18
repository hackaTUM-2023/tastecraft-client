//
//  Tag.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.23.
//

import SwiftUI

struct Tag: View {
    @State var isActive: Bool = false
    
    var label: String
    
    var body: some View {
        Button {
            isActive.toggle()
        } label: {
            HStack(alignment: .center, spacing: 10) {
                Label(label, systemImage: "checkmark")
                    .font(
                        Font
                            .custom("Montserrat", size: 14)
                            .weight(.semibold)
                    )
                    .foregroundColor(
                        Color(isActive ? "HelloFresh Green Dark" : "Black")
                    )
                    .if(!isActive) { view in
                        view
                            .labelStyle(.titleOnly)
                    }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(
                Color(isActive ? "HelloFresh Green Light" : "Grey")
                    .opacity(0.25)
            )
        .cornerRadius(50)
        }
    }
}

extension String{
    func getSize() -> CGFloat{
        let font = UIFont.systemFont(ofSize: 16)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: attributes)
        return size.width
    }
}

#Preview {
    Tag(isActive: false, label: "Greek")
}
