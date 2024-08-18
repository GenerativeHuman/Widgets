//
//  DropZoneRectangle.swift
//  Widgets
//
//  Created by Antony on 2024/08/19.
//

import SwiftUI

struct DropZoneRectangle: View {
    var dropZoneColor: Color?
    var viewModel: WidgetsViewModel
    
    var body: some View {
        ZStack {
            if (viewModel.node?.children == nil) || viewModel.node!.children.isEmpty {
                WelcomeTextView()
                RoundedRectangle(cornerRadius: 20)
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .foregroundColor(dropZoneColor == nil ? .gray : .clear)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(dropZoneColor ?? Color.clear)
                    )
                    .aspectRatio(1, contentMode: .fit)
            }
            if let widgets = viewModel.node?.children {
                ForEach(widgets, id: \.self) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill($0.color)
                        .frame(width: $0.width, height: $0.height)
                        .aspectRatio(1, contentMode: .fit)
                        .position(x: $0.x + $0.width / 2, y: $0.y + $0.height - 38)
                }
            }
        }
    }
}

#Preview {
    DropZoneRectangle(viewModel: .init())
}
