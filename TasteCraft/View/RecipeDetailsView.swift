//
//  RecipeDetailsView.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.23.
//

import SwiftUI

struct RecipeDetailsView: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    
    var body: some View {
        Text(recipeViewModel.recipe.title)
    }
}

#Preview {
    RecipeDetailsView()
        .environmentObject(RecipeViewModel(recipe:
                                        Recipe(id: 1, title: "Savory Herb Chicken", description: "A delicious chicken dish seasoned with aromatic herbs.", category: .chicken, cookingTimeMin: 45, ingredients: [Ingredient(id: 1, name: "Chicken"): 2, Ingredient(id: 2, name: "Rosemary"): 2, Ingredient(id: 3, name: "Thyme"): 1, Ingredient(id: 4, name: "Garlic"): 3, Ingredient(id: 5, name: "Olive oil"): 2])
                                    )
        )
}
