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
                                position: location,
                                size: CGSize(width: 50, height: 50))
        updateDropZoneColor(for: location)
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
