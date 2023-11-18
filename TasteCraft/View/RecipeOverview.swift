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
                HStack(spacing: 20) {
                    Text("Hey,\nMax Mustermann")
                        .font(
                            Font
                                .custom("Montserrat", size: 24)
                                .weight(.bold)
                        )
                        .padding(.top, 20)
                        .frame(width: 248, alignment: .topLeading)
                    Circle()
                        .fill(Color("HelloFresh Green Light"))
                        .frame(height: 60)
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
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack {
                                        ForEach(filteredResults, id: \.self) { recipe in
                                            NavigationLink {
                                                RecipeDetailsView()
                                                    .environmentObject(RecipeViewModel(recipe: recipe))
                                            } label: {
                                                RecipeTile(recipe: recipe)
                                            }.frame(width: 120)
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
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack {
                                        ForEach(filteredResults, id: \.self) { recipe in
                                            NavigationLink {
                                                RecipeDetailsView()
                                                    .environmentObject(RecipeViewModel(recipe: recipe))
                                            } label: {
                                                RecipeTile(recipe: recipe)
                                            }
                                        }
                                    }
                                }
                            }
                    }
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
        .padding(.horizontal, 20)
        .onAppear() {
            filteredResults = recipesViewModel.recipes
        }
    }
}

#Preview {
    var recipesViewModel = RecipesViewModel()
    recipesViewModel.recipes = [
        Recipe(id: 1, title: "Savory Herb Chicken", description: "A delicious chicken dish seasoned with aromatic herbs.", image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png", category: .chicken, cookingTimeMin: 45, requiredSkillLevel: "Beginner", ingredients: [Ingredient(id: 1, name: "Chicken"): 2, Ingredient(id: 2, name: "Rosemary"): 2, Ingredient(id: 3, name: "Thyme"): 1, Ingredient(id: 4, name: "Garlic"): 3, Ingredient(id: 5, name: "Olive oil"): 2]),
        Recipe(id: 2, title: "Classic Margherita Pizza", description: "A classic pizza with fresh tomatoes, mozzarella, and basil.", image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png", category: .pizza, cookingTimeMin: 30, requiredSkillLevel: "Beginner", ingredients: [Ingredient(id: 6, name: "Pizza dough"): 1, Ingredient(id: 7, name: "Tomato sauce"): 1/2, Ingredient(id: 8, name: "Fresh mozzarella"): 8, Ingredient(id: 9, name: "Basil leaves"): 1/4, Ingredient(id: 5, name: "Olive oil"): 1]),
        Recipe(id: 3, title: "Vegan Quinoa Salad", description: "A refreshing salad with quinoa, avocado, and lemon dressing.", image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png", category: .vegan, cookingTimeMin: 20, requiredSkillLevel: "Beginner", ingredients: [Ingredient(id: 10, name: "Quinoa"): 1, Ingredient(id: 11, name: "Avocado"): 1, Ingredient(id: 12, name: "Lemon"): 1, Ingredient(id: 13, name: "Olive oil"): 2, Ingredient(id: 14, name: "Salt"): 1/2]),
        Recipe(id: 4, title: "Creamy Tomato Soup", description: "A rich and creamy tomato soup perfect for cold days.", image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png", category: .soup, cookingTimeMin: 35, requiredSkillLevel: "Beginner", ingredients: [Ingredient(id: 15, name: "Tomato"): 5, Ingredient(id: 16, name: "Cream"): 1, Ingredient(id: 17, name: "Basil"): 1, Ingredient(id: 18, name: "Onion"): 1, Ingredient(id: 5, name: "Olive oil"): 2]),
        Recipe(id: 5, title: "Spicy Beef Tacos", description: "Tasty tacos filled with spicy beef and fresh vegetables.", image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png", category: .mainCourse, cookingTimeMin: 25, requiredSkillLevel: "Beginner", ingredients: [Ingredient(id: 19, name: "Beef"): 2, Ingredient(id: 20, name: "Taco shells"): 6, Ingredient(id: 21, name: "Lettuce"): 1, Ingredient(id: 22, name: "Tomato"): 2, Ingredient(id: 23, name: "Cheese"): 1]),
        Recipe(id: 6, title: "Chocolate Chip Cookies", description: "Delicious homemade cookies with chocolate chips.",  image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png", category: .dessert, cookingTimeMin: 20, requiredSkillLevel: "Beginner", ingredients: [Ingredient(id: 24, name: "Flour"): 2, Ingredient(id: 25, name: "Sugar"): 1, Ingredient(id: 26, name: "Chocolate chips"): 1, Ingredient(id: 27, name: "Butter"): 1, Ingredient(id: 2, name: "Eggs"): 2]),
        Recipe(id: 7, title: "Grilled Salmon", description: "Perfectly grilled salmon with a lemon butter sauce.", image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png", category: .seaFood, cookingTimeMin: 30, requiredSkillLevel: "Beginner", ingredients: [Ingredient(id: 28, name: "Salmon"): 2, Ingredient(id: 29, name: "Lemon"): 1, Ingredient(id: 30, name: "Butter"): 1, Ingredient(id: 31, name: "Garlic"): 2, Ingredient(id: 32, name: "Herbs"): 1]),
        Recipe(id: 8, title: "Pasta Carbonara", description: "A classic Italian pasta dish with eggs, cheese, and bacon.", image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png", category: .pasta, cookingTimeMin: 25, requiredSkillLevel: "Beginner", ingredients: [Ingredient(id: 33, name: "Pasta"): 1, Ingredient(id: 34, name: "Eggs"): 3, Ingredient(id: 35, name: "Bacon"): 1/2, Ingredient(id: 36, name: "Parmesan cheese"): 1/2, Ingredient(id: 37, name: "Black pepper"): 1]),
        Recipe(id: 9, title: "Balsamic Glazed Steak", description: "Steak glazed with a balsamic reduction and herbs.", image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png", category: .steak, cookingTimeMin: 40, requiredSkillLevel: "Beginner", ingredients: [Ingredient(id: 38, name: "Steak"): 2, Ingredient(id: 39, name: "Balsamic vinegar"): 1/4, Ingredient(id: 40, name: "Brown sugar"): 1/4, Ingredient(id: 41, name: "Garlic"): 2, Ingredient(id: 42, name: "Rosemary"): 1]),
        Recipe(id: 10, title: "Banana Bread", description: "Moist and flavorful banana bread with nuts.", image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png", category: .bakery, cookingTimeMin: 60, requiredSkillLevel: "Beginner", ingredients: [Ingredient(id: 43, name: "Banana"): 3, Ingredient(id: 24, name: "Flour"): 2, Ingredient(id: 25, name: "Sugar"): 1, Ingredient(id: 44, name: "Walnuts"): 1/2, Ingredient(id: 27, name: "Butter"): 1])
    ]
    
    return RecipeOverview()
        .environmentObject(recipesViewModel)
}
