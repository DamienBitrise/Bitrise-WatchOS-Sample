//
//  Bitrise_Watch_Sample_WatchKit_AppUITestsLaunchTests.swift
//  Bitrise Watch Sample WatchKit AppUITests
//
//  Created by Damien Murphy on 12/22/21.
//

import XCTest

class Bitrise_Watch_Sample_WatchKit_AppUITestsLaunchTests: XCTestCase {

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
            XCTFail("failed to run watch app")
        }
        
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
        
        sleep(5)
    }
    
    func testForWatchContent() throws {
        let app = XCUIApplication()
        app.launch()
        
        if !app.wait(for: .runningForeground, timeout: 15.0) {
            XCTFail("failed to run app")
        }
        
        app.staticTexts["Hello, World!"].tap()
    }
}
