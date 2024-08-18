//
//  Calculator.swift
//  Widgets
//
//  Created by Antony on 2024/08/19.
//

import Foundation

import SwiftUI

struct Calculator {
    func insertNewWidget(root: QuadTreeNode, color: Color) -> QuadTreeNode {
        root.insertChild(color: color)
    }
}
