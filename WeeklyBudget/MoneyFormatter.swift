//
//  MoneyFormatter.swift
//  WeeklyBudget
//
//  Created by Sam Meech-Ward on 2020-05-28.
//  Copyright © 2020 meech-ward. All rights reserved.
//

import Foundation

extension Decimal {
  
  var moneyString: String {
    let numberFormatter = NumberFormatter()
    numberFormatter.minimumFractionDigits = 2
    numberFormatter.roundingMode = .floor
    return numberFormatter.string(from: self as NSDecimalNumber) ?? ""
  }
}
