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
        title: "Paccheri",
        description: "A classic Italian pasta dish with a rich tomato sauce.",
        image: "paccheri",
        category: .pasta,
        cookingTimeMin: 30,
        requiredSkillLevel: "Intermediate",
        ingredients: [
            Ingredient(id: 1, name: "Paccheri pasta"): Amount(value: 500, unit: "grams"),
            Ingredient(id: 2, name: "Tomato sauce"): Amount(value: 2, unit: "cups"),
            Ingredient(id: 3, name: "Parmesan cheese"): Amount(value: 100, unit: "grams"),
            Ingredient(id: 4, name: "Garlic"): Amount(value: 2, unit: "cloves"),
            Ingredient(id: 5, name: "Olive oil"): Amount(value: 2, unit: "tablespoons"),
            // Add more ingredients as needed
        ]
    ),
    Recipe(
        id: 2,
        title: "Patatas",
        description: "A traditional Spanish potato dish.",
        image: "patatas",
        category: .vegan,
        cookingTimeMin: 40,
        requiredSkillLevel: "Beginner",
        ingredients: [
            Ingredient(id: 1, name: "Potatoes"): Amount(value: 4, unit: "large"),
            Ingredient(id: 2, name: "Olive oil"): Amount(value: 4, unit: "tablespoons"),
            Ingredient(id: 3, name: "Garlic"): Amount(value: 2, unit: "cloves"),
            Ingredient(id: 4, name: "Paprika"): Amount(value: 1, unit: "teaspoon"),
            Ingredient(id: 5, name: "Salt"): Amount(value: 1, unit: "teaspoon"),
            // Add more ingredients as needed
        ]
    ),
    Recipe(
        id: 3,
        title: "Orzo-Salat",
        description: "A refreshing and flavorful orzo pasta salad.",
        image: "orzo-salat",
        category: .salad,
        cookingTimeMin: 25,
        requiredSkillLevel: "Beginner",
        ingredients: [
            Ingredient(id: 1, name: "Orzo pasta"): Amount(value: 200, unit: "grams"),
            Ingredient(id: 2, name: "Cherry tomatoes"): Amount(value: 150, unit: "grams"),
            Ingredient(id: 3, name: "Cucumber"): Amount(value: 1, unit: "medium"),
            Ingredient(id: 4, name: "Red onion"): Amount(value: 1, unit: "small"),
            Ingredient(id: 5, name: "Feta cheese"): Amount(value: 100, unit: "grams"),
            Ingredient(id: 6, name: "Olive oil"): Amount(value: 3, unit: "tablespoons"),
            Ingredient(id: 7, name: "Lemon juice"): Amount(value: 2, unit: "tablespoons"),
            Ingredient(id: 8, name: "Fresh parsley"): Amount(value: 1, unit: "bunch"),
            Ingredient(id: 9, name: "Salt"): Amount(value: 1, unit: "teaspoon"),
            Ingredient(id: 10, name: "Black pepper"): Amount(value: 1, unit: "teaspoon"),
            // Add more ingredients as needed
        ]
    ),
    Recipe(
        id: 4,
        title: "Albondigas",
        description: "Traditional Spanish meatballs in a rich tomato sauce.",
        image: "albondigas",
        category: .mainCourse,
        cookingTimeMin: 60,
        requiredSkillLevel: "Intermediate",
        ingredients: [
            Ingredient(id: 1, name: "Ground beef"): Amount(value: 500, unit: "grams"),
            Ingredient(id: 2, name: "Bread crumbs"): Amount(value: 100, unit: "grams"),
            Ingredient(id: 3, name: "Egg"): Amount(value: 1, unit: "large"),
            Ingredient(id: 4, name: "Garlic"): Amount(value: 2, unit: "cloves"),
            Ingredient(id: 5, name: "Onion"): Amount(value: 1, unit: "medium"),
            Ingredient(id: 6, name: "Tomato sauce"): Amount(value: 2, unit: "cups"),
            Ingredient(id: 7, name: "Chicken broth"): Amount(value: 2, unit: "cups"),
            Ingredient(id: 8, name: "Olive oil"): Amount(value: 2, unit: "tablespoons"),
            Ingredient(id: 9, name: "Salt"): Amount(value: 1, unit: "teaspoon"),
            Ingredient(id: 10, name: "Pepper"): Amount(value: 1, unit: "teaspoon"),
            Ingredient(id: 11, name: "Parsley"): Amount(value: 1, unit: "bunch"),
            // Add more ingredients as needed
        ]
    ),
    Recipe(
        id: 5,
        title: "Chicken Jambalaya",
        description: "A hearty and spicy Cajun dish with chicken, rice, and vegetables.",
        image: "hahnchen-jambalaya",
        category: .chicken,
        cookingTimeMin: 60,
        requiredSkillLevel: "Intermediate",
        ingredients: [
            Ingredient(id: 1, name: "Chicken breast"): Amount(value: 500, unit: "grams"),
            Ingredient(id: 2, name: "Andouille sausage"): Amount(value: 250, unit: "grams"),
            Ingredient(id: 3, name: "Long-grain rice"): Amount(value: 2, unit: "cups"),
            Ingredient(id: 4, name: "Onion"): Amount(value: 1, unit: "large"),
            Ingredient(id: 5, name: "Green bell pepper"): Amount(value: 1, unit: "large"),
            Ingredient(id: 6, name: "Celery"): Amount(value: 2, unit: "stalks"),
            Ingredient(id: 7, name: "Garlic"): Amount(value: 3, unit: "cloves"),
            Ingredient(id: 8, name: "Canned tomatoes"): Amount(value: 1, unit: "can"),
            Ingredient(id: 9, name: "Chicken broth"): Amount(value: 4, unit: "cups"),
            Ingredient(id: 10, name: "Cajun seasoning"): Amount(value: 2, unit: "tablespoons"),
            Ingredient(id: 11, name: "Salt"): Amount(value: 1, unit: "teaspoon"),
            Ingredient(id: 12, name: "Black pepper"): Amount(value: 1, unit: "teaspoon"),
            // Add more ingredients as needed
        ]
    ),
    Recipe(
        id: 6,
        title: "Kartoffelrösti",
        description: "A traditional Swiss dish made from grated and fried potatoes.",
        image: "karteoffelrosti",
        category: .sideDish,
        cookingTimeMin: 30,
        requiredSkillLevel: "Beginner",
        ingredients: [
            Ingredient(id: 1, name: "Potatoes"): Amount(value: 500, unit: "grams"),
            Ingredient(id: 2, name: "Butter"): Amount(value: 3, unit: "tablespoons"),
            Ingredient(id: 3, name: "Salt"): Amount(value: 1, unit: "teaspoon"),
            Ingredient(id: 4, name: "Pepper"): Amount(value: 1, unit: "teaspoon"),
            Ingredient(id: 5, name: "Onion (optional)"): Amount(value: 1, unit: "small"),
            // Add more ingredients as needed
        ]
    ),
    Recipe(
        id: 7,
        title: "Bulgur Salad",
        description: "A nutritious and flavorful salad with bulgur wheat and fresh vegetables.",
        image: "burga-salat",
        category: .salad,
        cookingTimeMin: 20,
        requiredSkillLevel: "Beginner",
        ingredients: [
            Ingredient(id: 1, name: "Bulgur wheat"): Amount(value: 1, unit: "cup"),
            Ingredient(id: 2, name: "Cucumber"): Amount(value: 1, unit: "medium"),
            Ingredient(id: 3, name: "Tomatoes"): Amount(value: 2, unit: "medium"),
            Ingredient(id: 4, name: "Red onion"): Amount(value: 1, unit: "small"),
            Ingredient(id: 5, name: "Parsley"): Amount(value: 1, unit: "bunch"),
            Ingredient(id: 6, name: "Mint"): Amount(value: 1, unit: "bunch"),
            Ingredient(id: 7, name: "Lemon juice"): Amount(value: 3, unit: "tablespoons"),
            Ingredient(id: 8, name: "Olive oil"): Amount(value: 2, unit: "tablespoons"),
            Ingredient(id: 9, name: "Salt"): Amount(value: 1, unit: "teaspoon"),
            Ingredient(id: 10, name: "Pepper"): Amount(value: 1, unit: "teaspoon"),
            // Add more ingredients as needed
        ]
    )
]
