//
//  NavigationBarButtonStyle.swift
//  Recipes
//
//  Created by Natalie Alvarez on 6/21/23.
//

import Foundation
import SwiftUI

struct NavigationBarButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .padding(.horizontal, 10)
            .frame(minWidth: 70, maxHeight: 24)
            .foregroundColor(.white)
            .background(
                Capsule().stroke(Color.white, lineWidth: 2)
            )
    }
}
