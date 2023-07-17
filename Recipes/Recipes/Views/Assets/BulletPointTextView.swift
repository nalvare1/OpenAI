//
//  BulletPointTextView.swift
//  Recipes
//
//  Created by Natalie Alvarez on 6/21/23.
//

import SwiftUI

struct BulletPointView: View {
    var body: some View {
        Text("\u{2022}")
            .font(.system(.title3, design: .rounded))
            .fontWeight(.heavy)
            .foregroundColor(Color.green)
    }
}

struct BulletPointTextView: View {
    var text: String

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            BulletPointView()
            Text(text)
                .font(.system(.title3, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(Color.green)
        }
    }
}

#Preview {
    BulletPointTextView(text: "ingredient")
}
