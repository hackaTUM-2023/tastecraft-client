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
    var image: String
    var category: Category

    var cookingTimeMin: Int
    var requiredSkillLevel: String
    var ingredients: [Ingredient: Amount]
}

var mock_recipes = [
    Recipe(
            id: 1,
            title: "Savory Herb Chicken",
            description: "A delicious chicken dish seasoned with aromatic herbs.",
            image: "paccheri",
            category: .chicken,
            cookingTimeMin: 45,
            requiredSkillLevel: "Beginner",
            ingredients: [
                Ingredient(id: 1, name: "Chicken"): Amount(value: 2, unit: "pieces"),
                Ingredient(id: 2, name: "Rosemary"): Amount(value: 2, unit: "sprigs"),
                Ingredient(id: 3, name: "Thyme"): Amount(value: 1, unit: "sprig"),
                Ingredient(id: 4, name: "Garlic"): Amount(value: 3, unit: "cloves"),
                Ingredient(id: 5, name: "Olive oil"): Amount(value: 2, unit: "tablespoons")
            ]
        ),
        Recipe(
            id: 2,
            title: "Classic Margherita Pizza",
            description: "A classic pizza with fresh tomatoes, mozzarella, and basil.",
            image: "patatas",
            category: .pizza,
            cookingTimeMin: 30,
            requiredSkillLevel: "Beginner",
            ingredients: [
                Ingredient(id: 6, name: "Pizza dough"): Amount(value: 1, unit: "piece"),
                Ingredient(id: 7, name: "Tomato sauce"): Amount(value: 0.5, unit: "cup"),
                Ingredient(id: 8, name: "Fresh mozzarella"): Amount(value: 8, unit: "ounces"),
                Ingredient(id: 9, name: "Basil leaves"): Amount(value: 0.25, unit: "cup"),
                Ingredient(id: 5, name: "Olive oil"): Amount(value: 1, unit: "tablespoon")
            ]
        ),
    Recipe(
            id: 3,
            title: "Vegan Quinoa Salad",
            description: "A refreshing salad with quinoa, avocado, and lemon dressing.",
            image: "orzo-salat",
            category: .vegan,
            cookingTimeMin: 20,
            requiredSkillLevel: "Beginner",
            ingredients: [
                Ingredient(id: 10, name: "Quinoa"): Amount(value: 1, unit: "cup"),
                Ingredient(id: 11, name: "Avocado"): Amount(value: 1, unit: "whole"),
                Ingredient(id: 12, name: "Lemon"): Amount(value: 1, unit: "whole"),
                Ingredient(id: 13, name: "Olive oil"): Amount(value: 2, unit: "tablespoons"),
                Ingredient(id: 14, name: "Salt"): Amount(value: 0.5, unit: "teaspoon")
            ]
        ),
    Recipe(
            id: 4,
            title: "Creamy Tomato Soup",
            description: "A rich and creamy tomato soup perfect for cold days.",
            image: "albondigas",
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
        ),
        Recipe(
            id: 5,
            title: "Spicy Beef Tacos",
            description: "Tasty tacos filled with spicy beef and fresh vegetables.",
            image: "hahnchen-jambalaya",
            category: .mainCourse,
            cookingTimeMin: 25,
            requiredSkillLevel: "Beginner",
            ingredients: [
                Ingredient(id: 19, name: "Beef"): Amount(value: 2, unit: "pounds"),
                Ingredient(id: 20, name: "Taco shells"): Amount(value: 6, unit: "pieces"),
                Ingredient(id: 21, name: "Lettuce"): Amount(value: 1, unit: "head"),
                Ingredient(id: 22, name: "Tomato"): Amount(value: 2, unit: "whole"),
                Ingredient(id: 23, name: "Cheese"): Amount(value: 1, unit: "cup")
            ]
        ),
        Recipe(
            id: 6,
            title: "Pasta Carbonara",
            description: "A classic Italian pasta dish with eggs, cheese, and bacon.",
            image: "karteoffelrosti",
            category: .pasta,
            cookingTimeMin: 25,
            requiredSkillLevel: "Beginner",
            ingredients: [
                Ingredient(id: 33, name: "Pasta"): Amount(value: 1, unit: "pound"),
                Ingredient(id: 34, name: "Eggs"): Amount(value: 3, unit: "whole"),
                Ingredient(id: 35, name: "Bacon"): Amount(value: 0.5, unit: "pound"),
                Ingredient(id: 36, name: "Parmesan cheese"): Amount(value: 0.5, unit: "cup"),
                Ingredient(id: 37, name: "Black pepper"): Amount(value: 1, unit: "teaspoon")
            ]
        ),
]
