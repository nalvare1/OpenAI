//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Natalie Alvarez on 6/21/23.
//

import SwiftUI

struct RecipeDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var recipe: Item

    @State private var ingredients: [String] = []

    func getIngredients() -> [String] {
        guard let ingredientsArray = recipe.ingredients as? [String] else {
            fatalError("Failed to unwrap and convert `recipe.ingredients` to [String]")
        }
        return ingredientsArray
    }

    var body: some View {
        ScrollView {
            VStack {
                Text(recipe.name ?? "")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .padding(.vertical, 12)

                Text("Ingredients")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .padding(.vertical, 12)

                    VStack(alignment: .leading, spacing: 3) {
                        ForEach(ingredients, id: \.self) { ingredient in
                            BulletPointTextView(text: ingredient)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 10)
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 10)

                Text("Instructions")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .padding(.vertical, 12)

                Text(recipe.instructions ?? "")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.green)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 10)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 4)

                Spacer()
            }
        }
        .padding()
        .background(backgroundGradient)

        // Custom Navigation Bar button:
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack(spacing: 0) {
                        Image(systemName: "chevron.left")
                            .frame(width: 15)
                        //    .imageScale(.large)
                        Text("Back")

                    }
                }
                .buttonStyle(NavigationBarButtonStyle())

            )
        .onAppear {
            let fetchedIngredients = getIngredients()
            self.ingredients = fetchedIngredients
        }
    }
}

//#Preview {
//    RecipeDetailView(recipe: sampleRecipe)
//}
