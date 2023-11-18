//
//  Category.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.2023.
//

import Foundation

 enum Category: String, Codable, CaseIterable {
        case mainCourse = "Main Course"
        case sideDish = "Side Dish"
        case bread = "Bread"
        case homeMeal = "Home Meal"
        case steak = "Steak"
        case chicken = "Chicken"
        case seaFood = "Sea Food"
        case pizza = "Pizza"
        case burger = "Burger"
        case pasta = "Pasta"
        case kebap = "Kebap"
        case toast = "Toast or Sandwich"
        case vegan = "Vegan"
        case salad = "Salad"
        case appetizer = "Appetizer"
        case soup = "Soup"
        case breakfast = "Breakfast"
        case bakery = "Bakery"
        case snack = "Snack"
        case dessert = "Dessert"
        case babyFood = "Baby Food"
        case otherFood = "Other Food"
        case beverage = "Beverage"
        case sauce = "Sauce"
        case marinade = "Marinade"
        case fingerfood = "Finger Food"
        case drink = "Drink"
}