//
//  Budget.swift
//  WeeklyBudget
//
//  Created by Sam Meech-Ward on 2020-05-30.
//  Copyright © 2020 meech-ward. All rights reserved.
//

import Foundation

class Budget {
  
  var weeklyRemaining: Decimal {
    return _weeklyRemaining
  }
  var dailyRemaining: Decimal {
    return _dailyRemaining
  }
  private var _weeklyRemaining: Decimal
  private var _dailyRemaining: Decimal
  
  init(total: Decimal) {
    _weeklyRemaining = total
    _dailyRemaining = total/7
  }
  
  func addTransaction(amount: Decimal, timestamp: Date) {
    _weeklyRemaining -= amount
    _dailyRemaining -= amount
  }
  
}
