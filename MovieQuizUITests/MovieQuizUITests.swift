//
//  MovieQuizUITests.swift
//  MovieQuizUITests
//
//  Created by admin on 13.08.2023.
//

import XCTest

final class MovieQuizUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app.terminate()
        app = nil
    }
    
    func testYesButton() {
        sleep(3)
        
        let firstPoster = app.images["Poster"]
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        
        app.buttons["Yes"].tap()
        sleep(3)
        
        let secondPoster = app.images["Poster"]
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        
        XCTAssertNotEqual(firstPosterData, secondPosterData)
        
        let indexLable = app.staticTexts["Index"]
        
        XCTAssertEqual(indexLable.label, "2/10")
    }
    
    func testNoButton() {
        sleep(3)
        let firstPoster = app.images["Poster"].screenshot().pngRepresentation
        
        app.buttons["No"].tap()
        sleep(3)
        
        let secondPoster = app.images["Poster"].screenshot().pngRepresentation
        XCTAssertNotEqual(firstPoster, secondPoster)
        
        let indexLable = app.staticTexts["Index"]
        XCTAssertEqual(indexLable.label, "2/10")
        
    }
    
    func testGameFinishAlert() {
        sleep(3)
        
        for _ in 1...10 {
            app.buttons["Yes"].tap()
            sleep(3)
        }
        
        let alert = app.alerts["GameResult"]
        
        XCTAssertTrue(alert.exists)
        XCTAssertTrue(alert.label == "Этот раунд окончен")
        XCTAssertTrue(alert.buttons.firstMatch.label == "Сыграть еще раз?")
      
    }
    
    func testAlertDismiss() {
        sleep(3)
        
        for _ in 1...10 {
            app.buttons["Yes"].tap()
            sleep(3)
        }
        
        let alert = app.alerts["GameResult"]
        alert.buttons.firstMatch.tap()
        
        sleep(3)
        
        let indexLable = app.staticTexts["Index"]
        
        XCTAssertFalse(alert.exists)
        XCTAssertEqual(indexLable.label, "1/10")
    }
}
