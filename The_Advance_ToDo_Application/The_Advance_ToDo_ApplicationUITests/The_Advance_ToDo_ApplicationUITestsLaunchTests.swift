//
//  The_Advance_ToDo_ApplicationUITestsLaunchTests.swift
//  The_Advance_ToDo_ApplicationUITests
//
//  Created by Fatemeh (Fatima) Arab on 2025-03-10.
//

import XCTest

final class The_Advance_ToDo_ApplicationUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
