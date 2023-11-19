//
//  RecipeOverview.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.23.
//

import SwiftUI

struct RecipeOverview: View {
    @EnvironmentObject var recipesViewModel: RecipesViewModel
    @State private var searchQuery = ""
    @State private var filteredResults: [Recipe] = []
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    func filterRecipies() {
        filteredResults = searchQuery.isEmpty ? recipesViewModel.recipes : recipesViewModel.recipes
            .filter { $0.title.contains(searchQuery) }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 20) {
                    Text("Hey,\nBenedikt Geisberger")
                        .font(
                            Font
                                .custom("Montserrat", size: 22)
                                .weight(.bold)
                        )
                        .frame(width: 248, alignment: .topLeading)
                    Circle()
                        .fill(Color("HelloFresh Green Light"))
                        .frame(height: 42)
                }
                
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Recipe name...", text: $searchQuery)
                    Button(action: {
                        filterRecipies()
                    }) {
                        Text("Search")
                            .font(
                                Font
                                .custom("Montserrat", size: 14)
                            )
                            .foregroundColor(Color("Black"))
                    }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .frame(maxHeight: .infinity, alignment: .center)
                        .background(Color("HelloFresh Green Light"))
                        .cornerRadius(50)
                        .frame(height: 50)
                }
                    .padding(.trailing, 5)
                    .padding(.vertical, 5)
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color("Grey").opacity(0.1))
                    .cornerRadius(50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .inset(by: 1)
                            .stroke(Color(red: 0.62, green: 0.62, blue: 0.62).opacity(0.15), lineWidth: 2)
                    )
                    .padding(.horizontal, 20)
                
                if searchQuery.isEmpty {
                    ScrollView {
                        // New Recipes
                        VStack(alignment: .leading) {
                                Text("New Recipes")
                                  .font(
                                    Font.custom("Montserrat", size: 20)
                                      .weight(.bold)
                                  )
                                  .foregroundColor(Color("Black"))
                                  .frame(alignment: .topLeading)
                                  .padding(.horizontal, 20)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack {
                                        ForEach(filteredResults, id: \.self) { recipe in
                                            NavigationLink {
                                                RecipeDetailsView()
                                                    .environmentObject(RecipeViewModel(recipe: recipe))
                                            } label: {
                                                RecipeTile(recipe: recipe).padding(.leading, 20)
                                            }
                                        }
                                    }
                                }
                            }
                            
                            // Most Popular
                            VStack(alignment: .leading) {
                                Text("Most Popular")
                                  .font(
                                    Font.custom("Montserrat", size: 20)
                                      .weight(.bold)
                                  )
                                  .foregroundColor(Color("Black"))
                                  .frame(alignment: .topLeading)
                                  .padding(.horizontal, 20)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack {
                                        ForEach(filteredResults, id: \.self) { recipe in
                                            NavigationLink {
                                                RecipeDetailsView()
                                                    .environmentObject(RecipeViewModel(recipe: recipe))
                                            } label: {
                                                RecipeTile(recipe: recipe).padding(.leading, 20)
                                            }
                                        }
                                    }
                                }
                            }
                    }.padding(.vertical, 20)
                } else {
                    ZStack(alignment: .bottom) {
                        ScrollView {
                            LazyVGrid(columns: threeColumnGrid, spacing: 40) {
                                ForEach(filteredResults, id: \.self) { recipe in
                                    NavigationLink {
                                        RecipeDetailsView()
                                            .environmentObject(RecipeViewModel(recipe: recipe))
                                    } label: {
                                        RecipeTile(recipe: recipe)
                                    }
                                }
                            }
                            .refreshable {
                                // fetch recipies
                            }
                            .padding(20)
                        }
                    }
                }
            }
        }
        .onAppear() {
            filteredResults = recipesViewModel.recipes
        }
    }
}

#Preview {
    var recipesViewModel = RecipesViewModel()
    recipesViewModel.recipes = [
        Recipe(
                id: 1,
                title: "Savory Herb Chicken",
                description: "A delicious chicken dish seasoned with aromatic herbs.",
                image: "https://image_url_1.png",
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
                image: "https://image_url_2.png",
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
                image: "https://image_url_3.png",
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
                image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png",
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
                image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png",
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
                title: "Chocolate Chip Cookies",
                description: "Delicious homemade cookies with chocolate chips.",
                image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png",
                category: .dessert,
                cookingTimeMin: 20,
                requiredSkillLevel: "Beginner",
                ingredients: [
                    Ingredient(id: 24, name: "Flour"): Amount(value: 2, unit: "cups"),
                    Ingredient(id: 25, name: "Sugar"): Amount(value: 1, unit: "cup"),
                    Ingredient(id: 26, name: "Chocolate chips"): Amount(value: 1, unit: "cup"),
                    Ingredient(id: 27, name: "Butter"): Amount(value: 1, unit: "cup"),
                    Ingredient(id: 2, name: "Eggs"): Amount(value: 2, unit: "pieces")
                ]
            ),
        Recipe(
                id: 7,
                title: "Grilled Salmon",
                description: "Perfectly grilled salmon with a lemon butter sauce.",
                image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png",
                category: .seaFood,
                cookingTimeMin: 30,
                requiredSkillLevel: "Beginner",
                ingredients: [
                    Ingredient(id: 28, name: "Salmon"): Amount(value: 2, unit: "fillets"),
                    Ingredient(id: 29, name: "Lemon"): Amount(value: 1, unit: "whole"),
                    Ingredient(id: 30, name: "Butter"): Amount(value: 1, unit: "tablespoon"),
                    Ingredient(id: 31, name: "Garlic"): Amount(value: 2, unit: "cloves"),
                    Ingredient(id: 32, name: "Herbs"): Amount(value: 1, unit: "tablespoon")
                ]
            ),
            Recipe(
                id: 8,
                title: "Pasta Carbonara",
                description: "A classic Italian pasta dish with eggs, cheese, and bacon.",
                image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png",
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
            Recipe(
                id: 9,
                title: "Balsamic Glazed Steak",
                description: "Steak glazed with a balsamic reduction and herbs.",
                image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png",
                category: .steak,
                cookingTimeMin: 40,
                requiredSkillLevel: "Beginner",
                ingredients: [
                    Ingredient(id: 38, name: "Steak"): Amount(value: 2, unit: "pieces"),
                    Ingredient(id: 39, name: "Balsamic vinegar"): Amount(value: 0.25, unit: "cup"),
                    Ingredient(id: 40, name: "Brown sugar"): Amount(value: 0.25, unit: "cup"),
                    Ingredient(id: 41, name: "Garlic"): Amount(value: 2, unit: "cloves"),
                    Ingredient(id: 42, name: "Rosemary"): Amount(value: 1, unit: "tablespoon")
                ]
            ),
            Recipe(
                id: 10,
                title: "Banana Bread",
                description: "Moist and flavorful banana bread with nuts.",
                image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png",
                category: .bakery,
                cookingTimeMin: 60,
                requiredSkillLevel: "Beginner",
                ingredients: [
                    Ingredient(id: 43, name: "Banana"): Amount(value: 3, unit: "whole"),
                    Ingredient(id: 24, name: "Flour"): Amount(value: 2, unit: "cups"),
                    Ingredient(id: 25, name: "Sugar"): Amount(value: 1, unit: "cup"),
                    Ingredient(id: 44, name: "Walnuts"): Amount(value: 0.5, unit: "cup"),
                    Ingredient(id: 27, name: "Butter"): Amount(value: 1, unit: "cup")
                ]
            )
    ]
    
    return RecipeOverview()
        .environmentObject(recipesViewModel)
}
