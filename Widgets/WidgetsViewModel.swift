//
//  WidgetsViewModel.swift
//  Widgets
//
//  Created by Antony on 2024/08/19.
//

import SwiftUI
import Combine

class WidgetsViewModel: ObservableObject {
    @Published var dropZoneFrame: CGRect = .zero
    @Published var draggingWidget: Widget?
    @Published var dropZoneColor: Color?
    @Published var bottomWidgets: [Widget] = Widget.defaultWidgets()
    @Published var node: QuadTreeNode?
    private let calculator = Calculator()
    
    func handleWidgetDrag(widget: Widget, at location: CGPoint) {
        draggingWidget = Widget(color: widget.color,
                                position: location)
        updateDropZoneColor(for: location)
        // TODO: Using this location, calculate the widget's position and size in real-time.
        // Through this calculation, we can determine which area the object is dragged into.
        if dropZoneFrame.contains(location) {
            let center = CGPoint(x: dropZoneFrame.midX, y: dropZoneFrame.midY)
            let widgeIn = "Inside"
            if location.x < center.x {
                let widgeIn = location.y < center.y ? "Top Left" : "Bottom Left"
            } else {
                let widgeIn = location.y < center.y ? "Top Right" : "Bottom Right"
            }
        } else {
            let widgeIn = "Outside"
        }
    }
    
    func handleWidgetDrop(widget: Widget, at location: CGPoint) {
        if dropZoneFrame.contains(location) {
            if let node {
                self.node = calculator.insertNewWidget(root: node, color: widget.color)
            } else {
                let root = QuadTreeNode(x: 0,
                                        y: 0,
                                        width: dropZoneFrame.width,
                                        height: dropZoneFrame.height,
                                        color: .clear)
                self.node = calculator.insertNewWidget(root: root, color: widget.color)
            }
        }
        resetDragState()
    }
    
    func updateDropZoneColor(for location: CGPoint) {
        dropZoneColor = dropZoneFrame.contains(location) ? draggingWidget?.color : nil
    }
    
    func resetDragState() {
        draggingWidget = nil
        dropZoneColor = nil
    }
    
    func updateDropZoneFrame(_ frame: CGRect) {
        dropZoneFrame = frame
    }
}
