//
//  WidgetsView.swift
//  Widgets
//
//  Created by Antony on 2024/08/19.
//

import SwiftUI

struct WidgetsView: View {
    @StateObject private var viewModel = WidgetsViewModel()

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                DropZoneRectangle(dropZoneColor: viewModel.dropZoneColor, viewModel: viewModel)
                    .overlay(DropZoneFrameReader(onFrameChange: viewModel.updateDropZoneFrame))
                    .padding(.horizontal)
                Spacer()
                WidgetPaletteView(availableWidgets: viewModel.bottomWidgets,
                                  onDragChanged: viewModel.handleWidgetDrag,
                                  onDragEnded: viewModel.handleWidgetDrop)
            }
            DraggingWidgetView(widget: viewModel.draggingWidget)
        }
        // To provide a consistent reference point for measuring positions and sizes.
        .coordinateSpace(name: AppConstants.CoordinateSpaces.customContainer)
    }
}

#Preview {
    WidgetsView()
}
