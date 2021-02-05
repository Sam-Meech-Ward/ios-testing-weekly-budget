//
//  MoneyFormatter.swift
//  WeeklyBudgetTests
//
//  Created by Sam Meech-Ward on 2020-05-28.
//  Copyright © 2020 meech-ward. All rights reserved.
//

import XCTest
@testable import WeeklyBudget

class MoneyFormatterTests: XCTestCase {
  
  func testMoneyFormatterWholeNumber() {
    XCTAssertEqual(Decimal(string: "0")?.moneyString, "0.00")
    XCTAssertEqual(Decimal(string: "1")?.moneyString, "1.00")
    XCTAssertEqual(Decimal(string: "2")?.moneyString, "2.00")
    XCTAssertEqual(Decimal(string: "123")?.moneyString, "123.00")
    XCTAssertEqual(Decimal(string: "-2")?.moneyString, "-2.00")
  }
  
  func testMoneyFormatterDecimalNumberWithOneDecimalPlace() {
    XCTAssertEqual(Decimal(string: "1.1")?.moneyString, "1.10")
    XCTAssertEqual(Decimal(string: "1.2")?.moneyString, "1.20")
    XCTAssertEqual(Decimal(string: "-1.2")?.moneyString, "-1.20")
  }
  
  func testMoneyFormatterDecimalNumberWithTwoDecimalPlace() {
    XCTAssertEqual(Decimal(string: "1.11")?.moneyString, "1.11")
    XCTAssertEqual(Decimal(string: "1.12")?.moneyString, "1.12")
    XCTAssertEqual(Decimal(string: "-1.12")?.moneyString, "-1.12")
  }
  
  func testMoneyFormatterDecimalNumberWithAnyDecimalPlaces() {
    XCTAssertEqual(Decimal(string: "1.111")?.moneyString, "1.11")
    XCTAssertEqual(Decimal(string: "1.119")?.moneyString, "1.11")
    XCTAssertEqual(Decimal(string: "1.23456789")?.moneyString, "1.23")
    XCTAssertEqual(Decimal(string: "-1.23456789")?.moneyString, "-1.24")
  }
  
}
