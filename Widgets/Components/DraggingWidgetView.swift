//
//  DraggingWidgetView.swift
//  Widgets
//
//  Created by Antony on 2024/08/19.
//

import SwiftUI

struct DraggingWidgetView: View {
    let widget: Widget?
    
    var body: some View {
        Group {
            if let widget = widget {
                RoundedRectangle(cornerRadius: AppConstants.UI.cornerRadius)
                    .fill(widget.color)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 2, y: 2)
                    .frame(width: widget.size.width, height: widget.size.height)
                    .position(widget.position)
            }
        }
    }

}

#Preview {
    DraggingWidgetView(widget: .init(color: .skyBlue))
}
