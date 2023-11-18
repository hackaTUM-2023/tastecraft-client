//
//  RecipeDetailsView.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.23.
//

import SwiftUI

struct RecipeDetailsView: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            // Image
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 250, height: 250)
              .background(
                AsyncImage(url: URL(string: recipeViewModel.recipe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 250, height: 250)
                        .clipped()
                        .cornerRadius(15)
                } placeholder: {
                    ProgressView()
                }
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
                Font.custom("Montserrat", size: 12)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(Color("Black"))
              .frame(width: 260, alignment: .top)
        }
    }
}

#Preview {
    RecipeDetailsView()
        .environmentObject(RecipeViewModel(recipe:
            Recipe(id: 1, title: "Savory Herb Chicken", description: "A delicious chicken dish seasoned with aromatic herbs.", image: "https://static.lieferando.de/images/restaurants/de/RQQQ3NQN/products/20220217-_dsc3462_tuna_bowl.png", category: .chicken, cookingTimeMin: 45, requiredSkillLevel: "Beginner", ingredients: [Ingredient(id: 1, name: "Chicken"): 2, Ingredient(id: 2, name: "Rosemary"): 2, Ingredient(id: 3, name: "Thyme"): 1, Ingredient(id: 4, name: "Garlic"): 3, Ingredient(id: 5, name: "Olive oil"): 2])
            )
        )
}
