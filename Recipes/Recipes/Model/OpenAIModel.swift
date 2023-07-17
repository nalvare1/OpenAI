//
//  OpenAIModel.swift
//  Recipes
//
//  Created by Natalie Alvarez on 6/21/23.
//

// SwiftUI x OpenAIApi Package:
// https://github.com/MacPaw/OpenAI

import Foundation
import OpenAI


let openAI = OpenAI(apiToken: getOpenAIApiKey())

func getOpenAIApiKey() -> String {
    let apiKey = APIKeys.openAIApiKey

    return apiKey
}

func getRecipePrompt(userPrompt: String) -> String {
    let recipePrompt = """
    You are an AI-powered recipe book. The user is going to ask you for a recipe.
    You are going to reply with a JSON (decodable) dictionary (in SwiftUI) with the following variables, and NOTHING ELSE:
    - id: UUID (a valid UUID)
    - name: String (the name of the recipe)
    - instructions: String (a detailed step-by-step, numbered description of the instructions the user must take to cook the recipe)
    - ingredients: [String] (an array of ingredients)

    Your answer MUST be a JSON decodable "Recipe":
    struct Recipe: Codable, Identifiable {
        let id: UUID
        let name: String
        let instructions: String
        let ingredients: [String]
    }

    Here is the user's recipe:
    \(userPrompt)
    """
    return recipePrompt
}

func askChatGPT(prompt: String) async throws -> Recipe {
    let recipePrompt = getRecipePrompt(userPrompt: prompt)

    let query = ChatQuery(model: .gpt3_5Turbo, messages: [.init(role: .user, content: recipePrompt)])

    do {
        let result = try await openAI.chats(query: query)
        let recipe = getChatGPTResponse(result: result)

        print("askChatGPT(): recipe:\n\(recipe)")
        return recipe
    } catch {
        print("askChatGPT(): An error occurred:\n\(error)")
        throw error
    }
}

func getChatGPTResponse(result: ChatResult) -> Recipe {
    guard let firstChoice = result.choices.first else {
        fatalError("Failed to get first choice from result:\n\(result)")
    }

    guard let message = firstChoice.message.content else {
        fatalError("Failed to get message from first choice:\n\(firstChoice)")
    }

    let recipe: Recipe = Bundle.main.decode(message)
    return recipe
}
