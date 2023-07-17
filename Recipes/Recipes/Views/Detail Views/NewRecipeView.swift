//
//  NewRecipeView.swift
//  Recipes
//
//  Created by Natalie Alvarez on 6/21/23.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var recipeName: String = ""
    @State private var isLoading = false
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss

    private var isSaveButtonDisabled: Bool {
        recipeName.isEmpty
    }

    // MARK: Functions:
    private func addRecipe() {
        // start spinner:
        isLoading = true
        hideKeyboard()

        Task {
            // ask ChatGPT:
            let recipe: Recipe = try await askChatGPT(prompt: recipeName)

            // save recipe:
            saveRecipe(recipe: recipe)

            // UI: reset Text Input with animation, and stop spinner:
            withAnimation {
                recipeName = ""
            }
            isLoading = false

            // dismiss view:
            dismiss()
        }
    }

    private func saveRecipe(recipe: Recipe) {
        // add recipe:
        let newRecipe = Item(context: viewContext)
        newRecipe.id = UUID()
        newRecipe.name = recipe.name
        newRecipe.instructions = recipe.instructions
        newRecipe.ingredients = recipe.ingredients as NSObject

        // save it:
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    var body: some View {
        ZStack {
            // MARK: Background:
            backgroundGradient.ignoresSafeArea(.all)

            // MARK: View:
            VStack {
                HeaderView(headerType: 2)

                Spacer()

                Text("Ask ChatGPT for a Recipe:")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                VStack(spacing: 16) {
                    // Text Input:
                    TextField("New Recipe", text: $recipeName)
                        .foregroundColor(.green)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .padding()
                        .background(
                            Color(UIColor.secondarySystemBackground)
                        )
                        .cornerRadius(10)

                    // Save Button:
                    Button(action: {
                        addRecipe()
                        playSound(sound: "sound-ding", type: "mp3")
                        haptics.notificationOccurred(.success)
                    }, label: {
                        Spacer()
                        Text("Save".uppercased())
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        Spacer()
                    })
                    .disabled(isSaveButtonDisabled)
                    .onTapGesture {
                        if isSaveButtonDisabled {
                            playSound(sound: "sound-tap", type: "mp3")
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(isSaveButtonDisabled ? Color.gray : Color.green)
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.vertical, 20)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
                .frame(maxWidth: 640)

                if isLoading {
                    ProgressView {
                        HStack(spacing: 0) {
                            Image("open-ai-logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)

                            Text(" Asking ")
                                .font(.system(.title2, design: .rounded))
                                .fontWeight(.medium)
                                .foregroundColor(.black)


                            Text("ChatGPT...")
                                .font(.system(.title2, design: .rounded))
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                        }

                    }
                    .progressViewStyle(
                        CircularProgressViewStyle())
                    .padding()
                }

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    NewRecipeView()
}
