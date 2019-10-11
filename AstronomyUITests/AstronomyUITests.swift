//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Joshua Sharp on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launchArguments = ["UITesting"]
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSavingTwoPhotos() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        
        let photodetailviewcontrollerSavebuttonButton = app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        photodetailviewcontrollerSavebuttonButton.tap()
        if app.alerts["“Astronomy” Would Like to Access Your Photos"].exists {
            app.alerts["“Astronomy” Would Like to Access Your Photos"].buttons["OK"].tap()
        } else if app.alerts["Photo Saved!"].exists {
            app.alerts["Photo Saved!"].buttons["Okay"].tap()
        }
        app.navigationBars["Title"].buttons["Back"].tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 3).children(matching: .other).element.tap()
        photodetailviewcontrollerSavebuttonButton.tap()
        XCTAssertTrue(app.alerts["Photo Saved!"].exists, "Photo didn't save")
        app.alerts["Photo Saved!"].buttons["Okay"].tap()
    }
    
    func testSelectPhotoSegues () {
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        XCTAssertTrue(app.navigationBars["Title"].buttons["Back"].exists, "Back navigation didn't exist after selecting a photo")
    }
    
//    func testCrap() {
//        XCTAssertTrue (app.navigationBars["Back"].otherElements["Back"].exists)
//        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
//        XCTAssertEqual(app.otherElements.containing(.navigationBar, identifier:"Title").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.title, "Front Hazard Avoidance Camera")
//        XCTAssertTrue(app.staticTexts["Taken by 5 on 8/20/12, 8:00 PM (Sol 15)"].exists)
//        XCTAssertTrue(app.staticTexts["Camera:"].exists)
//        XCTAssertTrue(app.staticTexts["Front Hazard Avoidance Camera"].exists)
//
//    }
}
