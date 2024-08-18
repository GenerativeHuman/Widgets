//
//  DropZoneFrameReader.swift
//  Widgets
//
//  Created by Antony on 2024/08/19.
//

import SwiftUI

struct DropZoneFrameReader: View {
    let onFrameChange: (CGRect) -> Void
    
    var body: some View {
        GeometryReader { geometry in
            Color.clear.onAppear {
                self.onFrameChange(geometry.frame(in: .global))
            }
        }
    }
}
