//
//  Widget.swift
//  Widgets
//
//  Created by Antony on 2024/08/19.
//

import Foundation
import SwiftUI

struct Widget: Identifiable, Hashable {
    let id = UUID()
    let color: Color
    var position: CGPoint = .zero
    var size: CGSize = .init(width: 50, height: 50)
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func defaultWidgets() -> [Widget] {
        [
            .init(color: .skyBlue),
            .init(color: .hotPink),
            .init(color: .brightYellow),
            .init(color: .limeGreen),
            .init(color: .vibrantOrange)
        ]
    }
}
