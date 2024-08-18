//
//  WidgetPaletteView.swift
//  Widgets
//
//  Created by Antony on 2024/08/19.
//

import SwiftUI

struct WidgetPaletteView: View {
    let availableWidgets: [Widget]
    let onDragChanged: (Widget, CGPoint) -> Void
    let onDragEnded: (Widget, CGPoint) -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 36.0)
                .fill(Color.white)
                .frame(height: 72.0)
                .shadow(radius: 10)
                .padding()
            
            HStack(spacing: 20) {
                ForEach(availableWidgets, id: \.self) { widget in
                    WidgetView(widget: widget, onDragChanged: onDragChanged, onDragEnded: onDragEnded)
                }
            }
        }
    }}

#Preview {
    WidgetPaletteView(availableWidgets: Widget.defaultWidgets(), onDragChanged: {_,_ in }, onDragEnded: {_,_ in })
}
