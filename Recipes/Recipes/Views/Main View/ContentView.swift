//
//  ContentView.swift
//  Recipes
//
//  Created by Natalie Alvarez on 6/21/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var showNewRecipeView: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                // MARK: Background:
                backgroundGradient.ignoresSafeArea(.all)
                
                // MARK: App UI:
                VStack {
                    // MARK: Header:
                    HeaderView(headerType: 1)
                    
                    Spacer(minLength: 80)
                    
                    // MARK: "New Recipe" Button:
                    NewRecipeButton(showNewRecipeView: $showNewRecipeView)
                    
                    // MARK: Recipes:
                    RecipeListView()
                }
            }
        // MARK: New Recipe View:
        }.sheet(isPresented: $showNewRecipeView, content: {
            NewRecipeView()
        })

    }
}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
