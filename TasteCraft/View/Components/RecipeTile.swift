//
//  RecipeTile.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.23.
//

import SwiftUI

struct RecipeTile: View {
    var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Rectangle()
            .foregroundColor(.clear)
            .frame(width: 120, height: 120)
            .background(
                Image(recipe.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120)
                        .clipped()
                        .cornerRadius(15)
            )
            .padding(10)
            
            Text(recipe.title)
              .font(
                Font.custom("Montserrat", size: 16)
                  .weight(.bold)
              )
              .lineLimit(2, reservesSpace: true)
              .multilineTextAlignment(.center)
              .foregroundColor(Color("Black"))
              .frame(alignment: .top)
            
            Text("\(recipe.cookingTimeMin) min")
              .font(
                Font.custom("Montserrat", size: 11)
                  .weight(.medium)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(Color("Grey"))
              .frame(alignment: .top)
        }
        .frame(maxWidth: 120)
    }
}

#Preview {
    RecipeTile(recipe:  Recipe(
        id: 4,
        title: "Creamy Tomato Soup",
        description: "A rich and creamy tomato soup perfect for cold days.",
        image: "paccheri",
        category: .soup,
        cookingTimeMin: 35,
        requiredSkillLevel: "Beginner",
        ingredients: [
            Ingredient(id: 15, name: "Tomato"): Amount(value: 5, unit: "whole"),
            Ingredient(id: 16, name: "Cream"): Amount(value: 1, unit: "cup"),
            Ingredient(id: 17, name: "Basil"): Amount(value: 1, unit: "tablespoon"),
            Ingredient(id: 18, name: "Onion"): Amount(value: 1, unit: "whole"),
            Ingredient(id: 5, name: "Olive oil"): Amount(value: 2, unit: "tablespoons")
        ]
    ))
}
