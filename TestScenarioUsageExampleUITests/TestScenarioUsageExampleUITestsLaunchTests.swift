//
//  TestScenarioUsageExampleUITestsLaunchTests.swift
//  TestScenarioUsageExampleUITests
//
//  Created by dosgiandubh on 07/03/2022.
//

import XCTest

class TestScenarioUsageExampleUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
