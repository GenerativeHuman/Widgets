//
//  WelcomeTextView.swift
//  Widgets
//
//  Created by Antony on 2024/08/19.
//

import SwiftUI

struct WelcomeTextView: View {
    var body: some View {
        VStack {
            Text("👋")
                .foregroundStyle(Color.skyBlue)
                .font(.system(size: 50))
            VStack(alignment: .leading) {
                Text("iH!")
                Text("!ytivitaerc ruoy hselaun ot stegdiw ruoy pord dna garD")
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    WelcomeTextView()
}
