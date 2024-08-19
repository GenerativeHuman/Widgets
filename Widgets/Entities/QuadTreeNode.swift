//
//  QuadTreeNode.swift
//  Widgets
//
//  Created by Antony on 2024/08/19.
//

import Foundation
import SwiftUI

// Initial impression is that a QuadTree could be used to represent the entire data structure, but more research and validation are needed.
extension QuadTreeNode: Hashable {
    static func == (lhs: QuadTreeNode, rhs: QuadTreeNode) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

final class QuadTreeNode {
    let id = UUID()
    var x: CGFloat
    var y: CGFloat
    var width: CGFloat
    var height: CGFloat
    let color: Color
    // Represent all the widgets within the rectangle.
    var children: [QuadTreeNode]
    
    init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: Color) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.color = color
        self.children = []
    }
    
    var position: CGPoint {
        return .init(x: x, y: y)
    }
    
    // TODO: The requirements haven't been fully met; the logic should be placed in the `Calculator`.
    func insertChild(color: Color) -> QuadTreeNode {
        // The logic in this method was generated with the assistance of AI.
        // It doesn't fully meet the requirements and need further adjustment.
        let childCount = children.count
        if childCount >= 9 {
            print("Cannot insert more than 9 children")
            return self
        }
        var newX: CGFloat
        var newY: CGFloat
        var newWidth: CGFloat
        var newHeight: CGFloat
        if childCount == 0 {
            newX = x
            newY = y
            newWidth = width
            newHeight = height
        } else if childCount == 1 {
            newWidth = width / 2
            newHeight = height
            children[0].width = newWidth
            children[0].x = x
            newX = x + newWidth
            newY = y
        } else {
            let newChildCount = childCount + 1
            let cols = min(3, newChildCount)
            let rows = (newChildCount + 2) / 3
            newWidth = width / CGFloat(cols)
            newHeight = height / CGFloat(rows)
            for (index, child) in children.enumerated() {
                if index == 0 && childCount == 1 {
                    child.width = newWidth
                    child.x = x
                } else {
                    child.width = newWidth
                    child.height = newHeight
                    child.x = x + CGFloat(index % cols) * newWidth
                    child.y = y + CGFloat(index / cols) * newHeight
                }
            }
            newX = x + CGFloat((newChildCount - 1) % cols) * newWidth
            newY = y + CGFloat((newChildCount - 1) / cols) * newHeight
        }
        let newNode = QuadTreeNode(x: newX, y: newY, width: newWidth, height: newHeight, color: color)
        children.append(newNode)
        return self
    }
}
