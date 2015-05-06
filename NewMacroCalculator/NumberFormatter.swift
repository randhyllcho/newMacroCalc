//
//  NumberFormatter.swift
//  NewMacroCalculator
//
//  Created by RYAN CHRISTENSEN on 5/5/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class NumberFormatter: NSNumberFormatter {
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  override init() {
    super.init()
    self.maximumFractionDigits = 2
    self.minimumFractionDigits = 2
    self.alwaysShowsDecimalSeparator = true
    self.numberStyle = .DecimalStyle
  }
  static let sharedInstance = NumberFormatter()
}

