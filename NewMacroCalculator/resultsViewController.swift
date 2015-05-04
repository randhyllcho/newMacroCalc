//
//  resultsViewController.swift
//  NewMacroCalculator
//
//  Created by RYAN CHRISTENSEN on 4/17/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class resultsViewController: UIViewController {
  
  @IBOutlet weak var heightLabel: UILabel!
  @IBOutlet weak var weightLabel: UILabel!
  @IBOutlet weak var ageLabel: UILabel!
  @IBOutlet weak var usualWeightlabel: UILabel!
  @IBOutlet weak var reeLabel: UILabel!
  @IBOutlet weak var bmiLabel: UILabel!
  @IBOutlet weak var teeLowLabel: UILabel!
  @IBOutlet weak var teeHighLabel: UILabel!
  @IBOutlet weak var idealWeightLabel: UILabel!
  @IBOutlet weak var pctBodyWeightLabel: UILabel!
  @IBOutlet weak var pctUsualBodyWeight: UILabel!
  @IBOutlet weak var lowRangeWeightLabel: UILabel!
  @IBOutlet weak var highRangeWeightLabel: UILabel!
  
  var height: Float!
  var weight: String!
  var age: String!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.heightLabel.text = "\(Int(height))\""
      self.weightLabel.text = "\(weight)lbs"
      self.ageLabel.text = "\(age)years"
    }

  
    
  @IBAction func doneButtonPressed(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }


}
