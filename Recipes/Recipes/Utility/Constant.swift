//
//  Constant.swift
//  Recipes
//
//  Created by Natalie Alvarez on 6/21/23.
//

import SwiftUI

// Preview:
let sampleRecipe: Recipe = Recipe(id: UUID(), name: "Chicken Marsala", instructions: "1. Pound chicken until it is 1/4 inch thick.\n2. Mix flour, salt and pepper on a dish and coat both sides of chicken with the mixture.\n3. Heat olive oil in a pan over medium heat and cook the chicken until it is browned on both sides. Remove the chicken and set it aside.\n4. Add mushrooms, garlic and onions to the same pan. Cook for 3 minutes.\n5. Pour in marsala wine and chicken broth and bring to a simmer. Cook for 10 minutes until the sauce has thickened.\n6. Return the chicken to the pan and simmer for another 5-7 minutes until the chicken is cooked through.\n7. Serve hot with a side of pasta or rice.", ingredients: ["4 boneless, skinless chicken breasts", "1/2 cup all-purpose flour","1 tsp salt", "1 tsp black pepper", "2 tbsp olive oil", "8 oz sliced mushrooms", "2 cloves garlic, minced", "1 small onion, diced", "3/4 cup marsala wine", "3/4 cup chicken broth"])

// UI:
var backgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color.green, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

var backgroundGradientCapsule: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color.green, Color.white]), startPoint: .leading, endPoint: .trailing)
}

// UX:
let haptics = UINotificationFeedbackGenerator()
