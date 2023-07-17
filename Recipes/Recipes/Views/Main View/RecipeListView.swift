//
//  RecipeListView.swift
//  Recipes
//
//  Created by Natalie Alvarez on 6/21/23.
//

import SwiftUI

struct RecipeListView: View {
    // MARK: Fetching data:
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.id, ascending: true)],
        animation: .default)
    private var recipes: FetchedResults<Item>

    // MARK: Functions:
    private func deleteRecipe(offsets: IndexSet) {
        withAnimation {
            offsets.map { recipes[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    var body: some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    RecipeRowView(recipe: recipe)
                }

            }
            .onDelete(perform: deleteRecipe)
        }
        .listStyle(InsetGroupedListStyle()) // this list style has a grey background associated with it (the "scrollContentBackground")
        .scrollContentBackground(.hidden) // fixes transparent background issue (iOS16+)!
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
        .padding(.vertical, 0)
        .frame(maxWidth: 640)
    }
}

#Preview {
    RecipeListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        .background(backgroundGradient.ignoresSafeArea())
}
