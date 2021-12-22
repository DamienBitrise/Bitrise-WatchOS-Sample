//
//  Bitrise_Watch_SampleUITestsLaunchTests.swift
//  Bitrise Watch SampleUITests
//
//  Created by Damien Murphy on 12/22/21.
//

import XCTest

class Bitrise_Watch_SampleUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        if !app.wait(for: .runningForeground, timeout: 15.0) {
            XCTFail("failed to run app")
        }
        
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
        
        sleep(5)
    }
    
    func testForContent() throws {
        let app = XCUIApplication()
        app.launch()
        
        if !app.wait(for: .runningForeground, timeout: 15.0) {
            XCTFail("failed to run app")
        }
        
        app.staticTexts["Hello, world!"].tap()
    }
}
