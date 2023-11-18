//
//  Recipe.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.2023.
//

import Foundation

struct Recipe: Codable, Identifiable, Hashable {
    var id: Int
    var title: String
    var description: String
    var category: Category

    var cookingTimeMin: Int
    var ingredients: [Ingredient: Int]
}