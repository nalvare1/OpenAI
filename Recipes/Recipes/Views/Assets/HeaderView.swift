//
//  HeaderView.swift
//  Recipes
//
//  Created by Natalie Alvarez on 6/21/23.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.dismiss) var dismiss
    var headerType: Int = 0

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            switch(headerType) {
            case 2:
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Done")
                })
                .buttonStyle(NavigationBarButtonStyle())
                .padding(.leading, 8)
            default:
                Text("")
                    .frame(minWidth: 70)
                    .padding(.leading, 8)
            }

            Spacer()

            VStack(spacing: 0) {
                Text("Recipes")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)

                HStack(spacing: 3) {
                    Text("powered by")
                        .font(.system(.caption2, design: .rounded))
                        .fontWeight(.medium)
                        .foregroundColor(.black)

                    Image("open-ai-logo-text")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                }
            }

            Spacer()

            switch(headerType) {
            case 1:
                EditButton()
                    .buttonStyle(NavigationBarButtonStyle())
                    .padding(.trailing, 8)
            default:
                Text("")
                    .frame(minWidth: 70)
                    .padding(.trailing, 8)
            }
        }
    }
}

#Preview {
    NavigationView {
        HeaderView()
            .background(backgroundGradient.ignoresSafeArea())
    }
}

#Preview {
    NavigationView {
        HeaderView(headerType: 1)
            .background(backgroundGradient.ignoresSafeArea())
    }
}

#Preview {
    NavigationView {
        HeaderView(headerType: 2)
            .background(backgroundGradient.ignoresSafeArea())
    }
}
