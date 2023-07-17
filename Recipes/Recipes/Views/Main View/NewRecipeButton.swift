//
//  NewRecipeButton.swift
//  Recipes
//
//  Created by Natalie Alvarez on 6/21/23.
//

import SwiftUI

struct NewRecipeButton: View {
    @Binding var showNewRecipeView: Bool

    var body: some View {
        Button(action: {
            showNewRecipeView = true
            playSound(sound: "sound-ding", type: "mp3")
            haptics.notificationOccurred(.success)
        }, label: {
            Image(systemName: "plus.circle")
                .font(.system(size: 30, weight: .semibold, design: .rounded))
            Text("New Recipe")
                .font(.system(size: 24, weight: .bold, design: .rounded))
        })
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .background(
            backgroundGradientCapsule.clipShape(Capsule())
        )
    }
}

#Preview {
    NewRecipeButton(showNewRecipeView: .constant(false))
}
