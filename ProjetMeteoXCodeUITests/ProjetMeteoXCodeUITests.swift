//
//  ProjetMeteoXCodeUITests.swift
//  ProjetMeteoXCodeUITests
//
//  Created by Theo Blanchard on 10/18/24.
//

import XCTest

class ProjetMeteoXCodeUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

        func testWeatherFetchingUI() throws {
        let cityTextField = app.textFields["Entrez le nom d'une ville"]
        XCTAssertTrue(cityTextField.exists)

        cityTextField.tap()
        cityTextField.typeText("Paris")
        
        let getWeatherButton = app.buttons["Obtenir la météo"]
        XCTAssertTrue(getWeatherButton.exists)
        
        getWeatherButton.tap()
        
        
        }
}
