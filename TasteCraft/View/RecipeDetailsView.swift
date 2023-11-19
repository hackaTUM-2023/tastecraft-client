//
//  RecipeDetailsView.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.23.
//

import SwiftUI

struct RecipeDetailsView: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    
    func formatDouble(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        let number = NSNumber(value: value)
        let formattedValue = formatter.string(from: number)!
        return "\(formattedValue)"
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                // Image
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 250, height: 250)
                  .background(
                    Image(recipeViewModel.recipe.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 250, height: 250)
                            .clipped()
                            .cornerRadius(15)
                  )
                  .shadow(color: .black.opacity(0.15), radius: 12.5, x: 0, y: 4)
                
                // Title
                Text(recipeViewModel.recipe.title)
                  .font(
                    Font.custom("Montserrat", size: 24)
                      .weight(.bold)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color("Black"))
                  .frame(width: 260, alignment: .top)
                
                // Cooking Details
                HStack(alignment: .center, spacing: 25) {
                    HStack {
                        Image(systemName: "timer")
                            .foregroundColor(Color("HelloFresh Green Dark"))
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        VStack {
                            Text("\(recipeViewModel.recipe.cookingTimeMin)")
                              .font(
                                Font.custom("Montserrat", size: 24)
                                  .weight(.bold)
                              )
                              .multilineTextAlignment(.center)
                              .foregroundColor(Color("Black"))
                              .frame(width: 38.43213, alignment: .top)
                            
                            Text("min")
                              .font(
                                Font.custom("Montserrat", size: 12)
                                  .weight(.bold)
                              )
                              .multilineTextAlignment(.center)
                              .foregroundColor(Color("Black"))
                              .frame(width: 38.43213, alignment: .top)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "frying.pan")
                            .foregroundColor(Color("HelloFresh Green Dark"))
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        
                        Text("\(recipeViewModel.recipe.requiredSkillLevel)")
                          .font(
                            Font.custom("Montserrat", size: 16)
                              .weight(.bold)
                          )
                          .lineLimit(1)
                          .foregroundColor(Color("Black"))
                          .frame(alignment: .top)
                    }
                }
                
                // Description
                Tag(isActive: true, disabled: true, label: "Description")
                Text(recipeViewModel.recipe.description)
                  .font(
                    Font.custom("Montserrat", size: 16)
                      .weight(.semibold)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color("Black"))
                  .frame(width: 260, alignment: .top)
                  .padding(.bottom, 20)

                // Ingredients
                Tag(isActive: true, disabled: true, label: "Ingredients")
                ForEach(Array(recipeViewModel.recipe.ingredients.keys), id: \.self) { ingredient in
                    HStack {
                        Text("\(ingredient.name)")
                            .font(
                              Font.custom("Montserrat", size: 16)
                                .weight(.bold)
                            )
                        Spacer()
                        if let amount = recipeViewModel.recipe.ingredients[ingredient] {
                            HStack {
                                Text(formatDouble(value: amount.value))
                                    .font(
                                        Font.custom("Montserrat", size: 14)
                                    )
                                    .foregroundStyle(Color("Grey"))
                                Text("\(amount.unit)")
                                    .font(
                                        Font.custom("Montserrat", size: 14)
                                    )
                                    .foregroundStyle(Color("Grey"))
                            }
                        }
                    }.frame(width: 260, alignment: .top)
                }
            }
        }
    }
}

#Preview {
    RecipeDetailsView()
        .environmentObject(RecipeViewModel(recipe:
                                            Recipe(
                                                id: 1,
                                                title: "Savory Herb Chicken",
                                                description: "A delicious chicken dish seasoned with aromatic herbs.",
                                                image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png",
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
                                            )
        ))
}
