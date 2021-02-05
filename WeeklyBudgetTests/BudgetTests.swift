//
//  BudgetTests.swift
//  WeeklyBudgetTests
//
//  Created by Sam Meech-Ward on 2020-05-30.
//  Copyright © 2020 meech-ward. All rights reserved.
//

import XCTest
@testable import WeeklyBudget

class BudgetTests: XCTestCase {
  
  func testBugetContainsWeeklyRemaining() {
    let amounts: [Decimal] = [0,1,2,123]
    amounts.forEach { amount in
      let budget = Budget(total: amount)
      XCTAssertEqual(budget.weeklyRemaining, amount)
    }
  }
  
  func testBugetContainsDailyRemaining() {
    let amounts: [Decimal] = [0,7,14,70]
    amounts.forEach { amount in
      let budget = Budget(total: amount)
      XCTAssertEqual(budget.dailyRemaining, amount/7, "dailyRemaining is not \(amount)/7")
    }
  }
  
  func testTransactionDeductsFromWeeklyRemaining() {
    let budget = Budget(total: 10)
    budget.addTransaction(amount: 0, timestamp: Date())
    XCTAssertEqual(budget.weeklyRemaining, 10)
    
    budget.addTransaction(amount: 1, timestamp: Date())
    XCTAssertEqual(budget.weeklyRemaining, 9)
    
    budget.addTransaction(amount: 2, timestamp: Date())
    XCTAssertEqual(budget.weeklyRemaining, 7)
  }
  
  func testTransactionDeductsFromDailyRemaining() {
    let budget = Budget(total: 70)
    budget.addTransaction(amount: 0, timestamp: Date())
    XCTAssertEqual(budget.dailyRemaining, 10)
    
    budget.addTransaction(amount: 1, timestamp: Date())
    XCTAssertEqual(budget.dailyRemaining, 9)
    
    budget.addTransaction(amount: 2, timestamp: Date())
    XCTAssertEqual(budget.dailyRemaining, 7)
  }

}
