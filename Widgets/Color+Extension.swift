//
//  Color+Extension.swift
//  Widgets
//
//  Created by Antony on 2024/08/19.
//

import SwiftUI

extension Color {
    static let skyBlue = Color(hex: 0x00CFFF)
    static let hotPink = Color(hex: 0xFF5C93)
    static let brightYellow = Color(hex: 0xFFEB3B)
    static let limeGreen = Color(hex: 0xAEEA00)
    static let vibrantOrange = Color(hex: 0xFF6D00)
    
    init(hex: UInt, alpha: Double = 1) {
        self.init(.sRGB,
                  red: Double((hex >> 16) & 0xff) / 255,
                  green: Double((hex >> 08) & 0xff) / 255,
                  blue: Double((hex >> 00) & 0xff) / 255,
                  opacity: alpha)
    }
}
