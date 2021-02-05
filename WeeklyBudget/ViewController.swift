//
//  ViewController.swift
//  WeeklyBudget
//
//  Created by Sam Meech-Ward on 2020-05-28.
//  Copyright © 2020 meech-ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var todayRemaininglabel: UILabel!
  @IBOutlet weak var weeklyRemainingLabel: UILabel!
  @IBOutlet weak var transactionTextField: UITextField!
  @IBOutlet weak var totalBudgetTextField: UITextField!
  
  var budget: Budget?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  private func updateBudgetLabels() {
    weeklyRemainingLabel.text = budget?.weeklyRemaining.moneyString
    todayRemaininglabel.text = budget?.dailyRemaining.moneyString
  }

}

extension ViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard let total = Decimal(string: textField.text!) else {
      return true
    }
    
    if textField == totalBudgetTextField {
      budget = Budget(total: total)
    }
    
    if textField == transactionTextField {
      budget?.addTransaction(amount: total, timestamp: Date())
    }
    
    updateBudgetLabels()
    return true
  }
}
