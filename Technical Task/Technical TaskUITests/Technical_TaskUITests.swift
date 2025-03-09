//
//  Technical_TaskUITests.swift
//  Technical TaskUITests
//
//  Created by Rishabh Jain on 15/1/2025.
//

import XCTest

import XCTest

final class CryptoAppUITests: XCTestCase {

  let app = XCUIApplication()

  override func setUpWithError() throws {
    continueAfterFailure = false
    app.launch()
  }

  // Test if Crypto Prices list is displayed
  func testCryptoListIsDisplayed() {
    let cryptoList = app.tables.cells.firstMatch
    XCTAssertTrue(cryptoList.waitForExistence(timeout: 5), "Crypto list should be visible")
  }

  // Test if first crypto cell is tappable and navigates to detail view
  func testCryptoDetailNavigation() {
    let firstCryptoCell = app.tables.cells.element(boundBy: 0)
    XCTAssertTrue(firstCryptoCell.waitForExistence(timeout: 5), "First crypto cell should be present")

    firstCryptoCell.tap()

    let detailView = app.staticTexts["Current Price"]
    XCTAssertTrue(detailView.waitForExistence(timeout: 3), "Detail view should be displayed")
  }

  // Test if back button works from detail view
  func testBackButtonFromDetail() {
    let firstCryptoCell = app.tables.cells.element(boundBy: 0)
    firstCryptoCell.tap()

    let backButton = app.navigationBars.buttons.firstMatch
    XCTAssertTrue(backButton.exists, "Back button should be visible")

  }

  // Test if floating menu buttons are selectable
  func testFloatingMenuSelection() {
    let button1 = app.buttons["crypto"]
    let button2 = app.buttons["swap"]
    let button3 = app.buttons["settings"]

    button1.tap()
    XCTAssertTrue(button1.isSelected, "Crypto button should be selected")
    XCTAssertFalse(button2.isSelected, "Swap button should not be selected")
    XCTAssertFalse(button3.isSelected, "Settings button should not be selected")

    button2.tap()
    XCTAssertTrue(button2.isSelected, "Swap button should be selected")
    XCTAssertFalse(button1.isSelected, "Crypto button should not be selected")
    XCTAssertFalse(button3.isSelected, "Settings button should not be selected")

    button3.tap()
    XCTAssertTrue(button3.isSelected, "Settings button should be selected")
    XCTAssertFalse(button1.isSelected, "Crypto button should not be selected")
    XCTAssertFalse(button2.isSelected, "Swap button should not be selected")
  }
}
