//
//  RecipeViewModel.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.23.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
}
