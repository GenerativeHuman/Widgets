//
//  WidgetView.swift
//  Widgets
//
//  Created by Antony on 2024/08/19.
//

import SwiftUI

struct WidgetView: View {
    let widget: Widget
    let onDragChanged: (Widget, CGPoint) -> Void
    let onDragEnded: (Widget, CGPoint) -> Void
    
    var body: some View {
        Circle()
            .fill(widget.color)
            .frame(width: widget.size.width, height: widget.size.height)
            .gesture(
                DragGesture(coordinateSpace: .named("full screen"))
                    .onChanged { gesture in
                        onDragChanged(widget, gesture.location)
                    }
                    .onEnded { gesture in
                        onDragEnded(widget, gesture.location)
                    }
            )
    }
}

#Preview {
    WidgetView(widget: .init(color: .skyBlue), onDragChanged: { _,_ in }, onDragEnded: { _,_ in })
}
