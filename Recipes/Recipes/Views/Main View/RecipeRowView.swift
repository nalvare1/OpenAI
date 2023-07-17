//
//  RecipeRowView.swift
//  Recipes
//
//  Created by Natalie Alvarez on 6/21/23.
//

import SwiftUI

struct RecipeRowView: View {
    @ObservedObject var recipe: Item

    var body: some View {
        VStack {
            Text(recipe.name ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(Color.green)
                .padding(.vertical, 12)
                .animation(.default)
        }

    }
}
