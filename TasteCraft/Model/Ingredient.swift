//
//  Recipe.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.2023.
//

struct Ingredient: Codable, Hashable {
    var id: Int?
    var name: String
}


var replacement_ingredients: [String: String] = [
    "Tomato sauce": "Creamy White Sauce",
    "Garlic" : "Mild Onions"
]
