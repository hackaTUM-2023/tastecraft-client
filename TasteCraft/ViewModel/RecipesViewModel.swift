//
//  RecipesViewModel.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.23.
//

import Foundation

class RecipesViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    init() {
        self.recipes = mock_recipes
    }
}
