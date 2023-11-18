//
//  RecipeOverview.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.23.
//

import SwiftUI

struct RecipeOverview: View {
    @EnvironmentObject var recipiesViewModel: RecipiesViewModel
    @State private var searchQuery = ""
    @State private var settingsPresented = false
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ScrollView {
                    LazyVGrid(columns: threeColumnGrid, spacing: 40) {
                        ForEach(searchResults, id: \.self) { recipe in
                            NavigationLink {
                                RecipeDetailsView()
                                    .environmentObject(RecipeViewModel(recipe: recipe))
                            } label: {
                                VStack {
                                    AsyncImage(url: URL(string: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png")) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 50, height: 50)
                                    Text(recipe.title)
                                }
                                .padding(20)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .cornerRadius(15)
                                        .frame(width: 100, height: 150)
                                )
                            }
                        }
                    }
                    .refreshable {
                        // fetch recipies
                    }
                    .padding(20)
                }
                .navigationTitle("Recipies")
                Button(action: {
                    settingsPresented.toggle()
                }) {
                    Image(systemName: "gearshape.circle.fill")
                    .font(.system(size: 56))
                    .foregroundColor(.green)
                    .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                    .padding()
                }
            }
            .sheet(isPresented: $settingsPresented) {
                        Text("Settings")
                            .presentationDetents([.medium, .large])
                    }
        }
        .searchable(text: $searchQuery)
    }
    
    var searchResults: [Recipe] {
            if searchQuery.isEmpty {
                return recipiesViewModel.recipies
            } else {
                return recipiesViewModel.recipies
                    .filter { $0.title.contains(searchQuery) }
            }
        }
}

#Preview {
    var recipiesViewModel = RecipiesViewModel()
    recipiesViewModel.recipies = [
        Recipe(id: 1, title: "Savory Herb Chicken", description: "A delicious chicken dish seasoned with aromatic herbs.", category: .chicken, cookingTimeMin: 45, ingredients: [Ingredient(id: 1, name: "Chicken"): 2, Ingredient(id: 2, name: "Rosemary"): 2, Ingredient(id: 3, name: "Thyme"): 1, Ingredient(id: 4, name: "Garlic"): 3, Ingredient(id: 5, name: "Olive oil"): 2]),
        Recipe(id: 2, title: "Classic Margherita Pizza", description: "A classic pizza with fresh tomatoes, mozzarella, and basil.", category: .pizza, cookingTimeMin: 30, ingredients: [Ingredient(id: 6, name: "Pizza dough"): 1, Ingredient(id: 7, name: "Tomato sauce"): 1/2, Ingredient(id: 8, name: "Fresh mozzarella"): 8, Ingredient(id: 9, name: "Basil leaves"): 1/4, Ingredient(id: 5, name: "Olive oil"): 1]),
        Recipe(id: 3, title: "Vegan Quinoa Salad", description: "A refreshing salad with quinoa, avocado, and lemon dressing.", category: .vegan, cookingTimeMin: 20, ingredients: [Ingredient(id: 10, name: "Quinoa"): 1, Ingredient(id: 11, name: "Avocado"): 1, Ingredient(id: 12, name: "Lemon"): 1, Ingredient(id: 13, name: "Olive oil"): 2, Ingredient(id: 14, name: "Salt"): 1/2]),
        Recipe(id: 4, title: "Creamy Tomato Soup", description: "A rich and creamy tomato soup perfect for cold days.", category: .soup, cookingTimeMin: 35, ingredients: [Ingredient(id: 15, name: "Tomato"): 5, Ingredient(id: 16, name: "Cream"): 1, Ingredient(id: 17, name: "Basil"): 1, Ingredient(id: 18, name: "Onion"): 1, Ingredient(id: 5, name: "Olive oil"): 2]),
        Recipe(id: 5, title: "Spicy Beef Tacos", description: "Tasty tacos filled with spicy beef and fresh vegetables.", category: .mainCourse, cookingTimeMin: 25, ingredients: [Ingredient(id: 19, name: "Beef"): 2, Ingredient(id: 20, name: "Taco shells"): 6, Ingredient(id: 21, name: "Lettuce"): 1, Ingredient(id: 22, name: "Tomato"): 2, Ingredient(id: 23, name: "Cheese"): 1]),
        Recipe(id: 6, title: "Chocolate Chip Cookies", description: "Delicious homemade cookies with chocolate chips.", category: .dessert, cookingTimeMin: 20, ingredients: [Ingredient(id: 24, name: "Flour"): 2, Ingredient(id: 25, name: "Sugar"): 1, Ingredient(id: 26, name: "Chocolate chips"): 1, Ingredient(id: 27, name: "Butter"): 1, Ingredient(id: 2, name: "Eggs"): 2]),
        Recipe(id: 7, title: "Grilled Salmon", description: "Perfectly grilled salmon with a lemon butter sauce.", category: .seaFood, cookingTimeMin: 30, ingredients: [Ingredient(id: 28, name: "Salmon"): 2, Ingredient(id: 29, name: "Lemon"): 1, Ingredient(id: 30, name: "Butter"): 1, Ingredient(id: 31, name: "Garlic"): 2, Ingredient(id: 32, name: "Herbs"): 1]),
        Recipe(id: 8, title: "Pasta Carbonara", description: "A classic Italian pasta dish with eggs, cheese, and bacon.", category: .pasta, cookingTimeMin: 25, ingredients: [Ingredient(id: 33, name: "Pasta"): 1, Ingredient(id: 34, name: "Eggs"): 3, Ingredient(id: 35, name: "Bacon"): 1/2, Ingredient(id: 36, name: "Parmesan cheese"): 1/2, Ingredient(id: 37, name: "Black pepper"): 1]),
        Recipe(id: 9, title: "Balsamic Glazed Steak", description: "Steak glazed with a balsamic reduction and herbs.", category: .steak, cookingTimeMin: 40, ingredients: [Ingredient(id: 38, name: "Steak"): 2, Ingredient(id: 39, name: "Balsamic vinegar"): 1/4, Ingredient(id: 40, name: "Brown sugar"): 1/4, Ingredient(id: 41, name: "Garlic"): 2, Ingredient(id: 42, name: "Rosemary"): 1]),
        Recipe(id: 10, title: "Banana Bread", description: "Moist and flavorful banana bread with nuts.", category: .bakery, cookingTimeMin: 60, ingredients: [Ingredient(id: 43, name: "Banana"): 3, Ingredient(id: 24, name: "Flour"): 2, Ingredient(id: 25, name: "Sugar"): 1, Ingredient(id: 44, name: "Walnuts"): 1/2, Ingredient(id: 27, name: "Butter"): 1])
    ]
    
    return RecipeOverview()
        .environmentObject(recipiesViewModel)
}
