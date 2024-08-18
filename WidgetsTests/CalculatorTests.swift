//
//  CalculatorTests.swift
//  WidgetsTests
//
//  Created by Antony on 2024/08/19.
//

import XCTest
@testable import Widgets

final class CalculatorTests: XCTestCase {
    private var sut: Calculator!
    // 398: iPhone 15 Pro Max width + padding
    private let dropZoneFrame = CGRect(x: 16.0, y: 279.5, width: 398.0, height: 398.0)
    private var root: QuadTreeNode!
    
    override func setUpWithError() throws {
        sut = Calculator()
        root = QuadTreeNode(x: 0, y: 0, width: dropZoneFrame.width, height: dropZoneFrame.height, color: .clear)
    }

    override func tearDownWithError() throws {
        sut = nil
        root = nil
    }

    func test_calculateWidgets_when0Widget() throws {
        
    }
    
    func test_calculateWidgets_whenDrop1Widget() {
        // when
        let expectedWidgets = sut.insertNewWidget(root: root, color: .skyBlue).children
        
        // then
        XCTAssertEqual(expectedWidgets.count, 1)
        XCTAssertEqual(expectedWidgets[0].width, dropZoneFrame.size.width)
        XCTAssertEqual(expectedWidgets[0].height, dropZoneFrame.size.height)
    }
    
    func test_calculateWidgets_whenDrop2Widgets() {
        // given
        _ = sut.insertNewWidget(root: root, color: .skyBlue).children
        
        // when
        let expectedWidgets = sut.insertNewWidget(root: root, color: .hotPink).children
        
        // then
        XCTAssertEqual(expectedWidgets.count, 2)
        XCTAssertEqual(expectedWidgets[0].width, dropZoneFrame.size.width / 2)
        XCTAssertEqual(expectedWidgets[0].height, dropZoneFrame.size.height)
        XCTAssertEqual(expectedWidgets[1].width, dropZoneFrame.size.width / 2)
        XCTAssertEqual(expectedWidgets[1].height, dropZoneFrame.size.height)
    }
    
    func test_calculateWidgets_whenDrop3Widgets() {
        // given
        _ = sut.insertNewWidget(root: root, color: .skyBlue).children
        _ = sut.insertNewWidget(root: root, color: .hotPink).children
        
        // when
        let expectedWidgets = sut.insertNewWidget(root: root, color: .limeGreen).children
        
        // then
        XCTAssertEqual(expectedWidgets.count, 3)
        XCTAssertEqual(expectedWidgets[0].width, dropZoneFrame.size.width / 3)
        XCTAssertEqual(expectedWidgets[0].height, dropZoneFrame.size.height)
        XCTAssertEqual(expectedWidgets[1].width, dropZoneFrame.size.width / 3)
        XCTAssertEqual(expectedWidgets[1].height, dropZoneFrame.size.height)
        XCTAssertEqual(expectedWidgets[2].width, dropZoneFrame.size.width / 3)
        XCTAssertEqual(expectedWidgets[2].height, dropZoneFrame.size.height)
    }
}
