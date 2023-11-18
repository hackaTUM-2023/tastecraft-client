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
        VStack(alignment: .center, spacing: 10) {
            Rectangle()
            .foregroundColor(.clear)
            .frame(width: 120, height: 120)
            .background(
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120)
                        .clipped()
                        .cornerRadius(15)
                } placeholder: {
                    ProgressView()
                }
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
    RecipeTile(recipe: Recipe(id: 7, title: "Grilled Salmon", description: "Perfectly grilled salmon with a lemon butter sauce.", image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png", category: .seaFood, cookingTimeMin: 30, ingredients: [Ingredient(id: 28, name: "Salmon"): 2, Ingredient(id: 29, name: "Lemon"): 1, Ingredient(id: 30, name: "Butter"): 1, Ingredient(id: 31, name: "Garlic"): 2, Ingredient(id: 32, name: "Herbs"): 1]))
}
