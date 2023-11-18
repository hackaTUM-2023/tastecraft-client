//
//  TagInput.swift
//  TasteCraft
//
//  Created by Benedikt Geisberger on 18.11.23.
//

import SwiftUI

struct TagInput: View {
    @Binding var input: String
    
    var onSubmit: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: "plus")
                .foregroundColor(Color("Grey"))
                .font(.system(size: 16).bold())
            TextField(
                "Add your own category",
                text: $input
            )
            .font(
                Font.custom("Montserrat", size: 14)
                    .weight(.semibold)
            )
        }   
        .padding(10.0)
        .background(Color("Grey").opacity(0.25))
        .cornerRadius(50)
        .onSubmit {
            onSubmit()
        }
        
    }
}

#Preview {
    struct Preview: View {
        @State var input = ""
            var body: some View {
                TagInput(input: $input, onSubmit: {
                    print("Save: ", input)
                })
            }
        }

    return Preview()
}
