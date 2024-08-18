//
//  WidgetsView.swift
//  Widgets
//
//  Created by Antony on 2024/08/19.
//

import SwiftUI

struct WidgetsView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    WidgetsView()
}
