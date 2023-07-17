//
//  RecipeModel.swift
//  Recipes
//
//  Created by Natalie Alvarez on 6/21/23.
//

import SwiftUI

struct Recipe: Codable, Identifiable {
    let id: UUID
    let name: String
    let instructions: String
    let ingredients: [String]
}
