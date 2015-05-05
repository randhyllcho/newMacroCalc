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
  @IBOutlet weak var idealWeightLabel: UILabel!
  @IBOutlet weak var pctBodyWeightLabel: UILabel!
  @IBOutlet weak var pctUsualBodyWeight: UILabel!
  @IBOutlet weak var lowRangeWeightLabel: UILabel!
  @IBOutlet weak var highRangeWeightLabel: UILabel!
  @IBOutlet weak var pctChange: UILabel!
  @IBOutlet weak var heightInCMLabel: UILabel!
  @IBOutlet weak var weightInKGLabel: UILabel!
  
  var height: Float!
  var weight: String!
  var age: String!
  var usualWeight: String!
  var teeLow: String!
  var IBW: String!
  var REE: String!
  var BMI: String!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.heightLabel.text = "\(Int(height))\""
      self.weightLabel.text = "\(weight)lbs"
      self.ageLabel.text = "\(age)years"
      self.usualWeightlabel.text = "Usual:\(usualWeight)lbs"
      self.teeLowLabel.text = "\(teeLow)"
      self.idealWeightLabel.text = "\(IBW)lbs"
      self.lowRangeWeightLabel.text = "\((IBW as NSString).floatValue - (((IBW as NSString).floatValue) * 0.1))lbs   -"
      self.highRangeWeightLabel.text = "\((IBW as NSString).floatValue + (((IBW as NSString).floatValue) * 0.1))lbs"
      self.pctBodyWeightLabel.text = "\(((weight as NSString).floatValue / (IBW as NSString).floatValue) * 100)%"
      self.pctUsualBodyWeight.text = "\(((weight as NSString).floatValue / (usualWeight as NSString).floatValue) * 100)%"
      self.pctChange.text = "\(round(((((weight as NSString).floatValue) - (usualWeight as NSString).floatValue) / (usualWeight as NSString).floatValue) * 100))%"
      self.heightInCMLabel.text = "\(round(height * 2.54))cm"
      self.weightInKGLabel.text = "\(round((weight as NSString).floatValue / 2.2))kg"
      self.reeLabel.text = "\(REE)"
      self.bmiLabel.text = "\(BMI)"
    }

  
    
  @IBAction func doneButtonPressed(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
