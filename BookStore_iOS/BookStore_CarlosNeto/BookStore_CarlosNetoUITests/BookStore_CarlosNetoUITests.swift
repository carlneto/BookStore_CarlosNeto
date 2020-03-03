//
//  BookStore_CarlosNetoUITests.swift
//  BookStore_CarlosNetoUITests
//
//  Created by Carlos Neto on 02/03/2020.
//  Copyright © 2020 Carlos Neto. All rights reserved.
//

import XCTest

class BookStore_CarlosNetoUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFavSwitchOn_success() {
        let app = XCUIApplication()
        app.launch()
        let favSwitch = app.switches["SqT-4C-Zox"]
        favSwitch.swipeRight()
        XCTAssert((favSwitch.value as? String) == "1")
    }

    func testFavSwitchOn_error() {
        let app = XCUIApplication()
        app.launch()
        let favSwitch = app.switches["SqT-4C-Zox"]
        favSwitch.tap()
        favSwitch.swipeLeft()
        XCTAssertFalse((favSwitch.value as? String) == "1")
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
