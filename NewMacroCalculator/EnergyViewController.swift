//
//  EnergyViewController.swift
//  NewMacroCalculator
//
//  Created by RYAN CHRISTENSEN on 4/16/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class EnergyViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var heightSlider: UISlider!
  @IBOutlet weak var heightLabel: UILabel!
  @IBOutlet weak var weightTextField: UITextField!
  @IBOutlet weak var energyLabel: UILabel!
  @IBOutlet weak var ageTextField: UITextField!
  @IBOutlet weak var bedRiddenLabel: UILabel!
  @IBOutlet weak var sedintaryLabel: UILabel!
  @IBOutlet weak var lightActivityLabel: UILabel!
  @IBOutlet weak var moderateLabel: UILabel!
  @IBOutlet weak var highActivityLable: UILabel!
  @IBOutlet weak var veryHighActivityLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.weightTextField.delegate = self
      self.bedRiddenLabel.alpha = 0
      self.sedintaryLabel.alpha = 0
      self.lightActivityLabel.alpha = 0
      self.moderateLabel.alpha = 0
      self.highActivityLable.alpha = 0
      self.veryHighActivityLabel.alpha = 0
    }
  
  override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    self.weightTextField.resignFirstResponder()
    self.ageTextField.resignFirstResponder()
  }
  
  func getBMI() -> Float {
    var currentValue = round(self.heightSlider.value)
    var BMI = (((weightTextField.text as NSString).floatValue) * 703) / (currentValue * currentValue)
    if BMI < 18.5 {
      println("Underweight")
    } else if BMI < 24.9 {
      println("Normal")
    } else if BMI < 29.9 {
      println("Overweight")
    } else {
      println("Obese")
    }
    return BMI
  }
  
  func restEnergyMale() -> Float{
    var currentValue = round(self.heightSlider.value)
    var heightInCM = currentValue * 2.5
    var weightInKG = (self.weightTextField.text as NSString).floatValue / 2.2
    var age = (self.ageTextField.text as NSString).floatValue
    var restEnergyEstimate = (10 * weightInKG) + (6.25 * heightInCM) - (5 * age) + 5
    return restEnergyEstimate
  }
  
  func restEnergyFemale() -> Float{
    var currentValue = round(self.heightSlider.value)
    var heightInCM = currentValue * 2.5
    var weightInKG = (self.weightTextField.text as NSString).floatValue / 2.2
    var age = (self.ageTextField.text as NSString).floatValue
    var restEnergyEstimate = (10 * weightInKG) + (6.25 * heightInCM) - (5 * age) - 161
    return restEnergyEstimate
  }

  @IBAction func heightSliderChanged(sender: AnyObject) {
    var currentValue = Int(round(self.heightSlider.value))
    self.heightLabel.text = "\(currentValue)\""
  }
  
  @IBAction func maleButtonPressed(sender: AnyObject) {
    var ree = (self.restEnergyMale().description as NSString).floatValue
    self.restEnergyMale()
    self.energyLabel.text = "\(ree)"
  }
  
  @IBAction func femaleButtonPressed(sender: AnyObject) {
    var ree = (self.restEnergyFemale().description as NSString).floatValue
    self.restEnergyFemale()
    self.energyLabel.text = "REE: \(Int(round(ree)))"
  }
  
  @IBAction func bedRiddenButton(sender: AnyObject) {
    UIView.animateWithDuration(0.75, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
      self.bedRiddenLabel.alpha = 1
    }) { (finished) -> Void in
       UIView.animateWithDuration(0.75, delay: 3.0, options: nil, animations: { () -> Void in
        self.bedRiddenLabel.alpha = 0
       }, completion: { (finished) -> Void in
        var maleREE = (self.restEnergyMale().description as NSString).floatValue
        self.getBMI()
        if self.getBMI() < 18.5 {
          self.energyLabel.text = "TEE: \(maleREE * 1.2)-\(maleREE * 1.3)"
          println("Underweight")
        } else if self.getBMI() < 24.9 {
          self.energyLabel.text = "TEE: \(maleREE * 1.0)-\(maleREE * 1.1)"
          println("Normal")
        } else if self.getBMI() < 29.9 {
          self.energyLabel.text = "TEE: \(maleREE * 1.0)"
          println("Overweight")
        } else {
          self.energyLabel.text = "TEE: \(maleREE * 1.0)"
          println("Obese")
        }
      })
    }
  }
  
  @IBAction func sedentaryButton(sender: AnyObject) {
    UIView.animateWithDuration(0.75, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
      self.sedintaryLabel.alpha = 1
      }) { (finished) -> Void in
        UIView.animateWithDuration(0.75, delay: 3.0, options: nil, animations: { () -> Void in
          self.sedintaryLabel.alpha = 0
          }, completion: { (finished) -> Void in
            var maleREE = (self.restEnergyMale().description as NSString).floatValue
            self.getBMI()
            if self.getBMI() < 18.5 {
              self.energyLabel.text = "TEE: \(maleREE * 1.3)-\(maleREE * 1.4)"
              println("Underweight")
            } else if self.getBMI() < 24.9 {
              self.energyLabel.text = "TEE: \(maleREE * 1.2)-\(maleREE * 1.3)"
              println("Normal")
            } else if self.getBMI() < 29.9 {
              self.energyLabel.text = "TEE: \(maleREE * 1.1)-\(maleREE * 1.2)"
              println("Overweight")
            } else {
              self.energyLabel.text = "TEE: \(maleREE * 1.1)-\(maleREE * 1.2)"
              println("Obese")
            }
        })

    }
  }

  @IBAction func lightActivityButton(sender: AnyObject) {
    UIView.animateWithDuration(0.75, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
      self.lightActivityLabel.alpha = 1
      }) { (finished) -> Void in
        UIView.animateWithDuration(0.75, delay: 5.0, options: nil, animations: { () -> Void in
          self.lightActivityLabel.alpha = 0
          }, completion: { (finished) -> Void in
            var maleREE = (self.restEnergyMale().description as NSString).floatValue
            self.getBMI()
            if self.getBMI() < 18.5 {
              self.energyLabel.text = "TEE: \(maleREE * 1.4)-\(maleREE * 1.5)"
              println("Underweight")
            } else if self.getBMI() < 24.9 {
              self.energyLabel.text = "TEE: \(maleREE * 1.3)-\(maleREE * 1.4)"
              println("Normal")
            } else if self.getBMI() < 29.9 {
              self.energyLabel.text = "TEE: \(maleREE * 1.2)-\(maleREE * 1.3)"
              println("Overweight")
            } else {
              self.energyLabel.text = "TEE: \(maleREE * 1.2)-\(maleREE * 1.3)"
              println("Obese")
            }
        })

    }
  }
  
  @IBAction func moderateButton(sender: AnyObject) {
    UIView.animateWithDuration(0.75, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
      self.moderateLabel.alpha = 1
      }) { (finished) -> Void in
        UIView.animateWithDuration(0.75, delay: 6.0, options: nil, animations: { () -> Void in
          self.moderateLabel.alpha = 0
          }, completion: { (finished) -> Void in
            var maleREE = (self.restEnergyMale().description as NSString).floatValue
            self.getBMI()
            if self.getBMI() < 18.5 {
              self.energyLabel.text = "TEE: \(maleREE * 1.5)-\(maleREE * 1.6)"
              println("Underweight")
            } else if self.getBMI() < 24.9 {
              self.energyLabel.text = "TEE: \(maleREE * 1.4)-\(maleREE * 1.5)"
              println("Normal")
            } else if self.getBMI() < 29.9 {
              self.energyLabel.text = "TEE: \(maleREE * 1.3)-\(maleREE * 1.4)"
              println("Overweight")
            } else {
              self.energyLabel.text = "TEE: \(maleREE * 1.3)-\(maleREE * 1.4)"
              println("Obese")
            }
        })

    }
  }
  
  @IBAction func highActivityButton(sender: AnyObject) {
    UIView.animateWithDuration(0.75, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
      self.highActivityLable.alpha = 1
      }) { (finished) -> Void in
        UIView.animateWithDuration(0.75, delay: 6.0, options: nil, animations: { () -> Void in
          self.highActivityLable.alpha = 0
          }, completion: { (finished) -> Void in
            var maleREE = (self.restEnergyMale().description as NSString).floatValue
            self.getBMI()
            if self.getBMI() < 18.5 {
              self.energyLabel.text = "TEE: \(maleREE * 1.6)-\(maleREE * 1.8)"
              println("Underweight")
            } else if self.getBMI() < 24.9 {
              self.energyLabel.text = "TEE: \(maleREE * 1.5)-\(maleREE * 1.6)"
              println("Normal")
            } else if self.getBMI() < 29.9 {
              self.energyLabel.text = "TEE: \(maleREE * 1.4)-\(maleREE * 1.5)"
              println("Overweight")
            } else {
              self.energyLabel.text = "TEE: \(maleREE * 1.4)-\(maleREE * 1.5)"
              println("Obese")
            }
        })

    }
  }
  
  @IBAction func veryHighActivityButton(sender: AnyObject) {
    UIView.animateWithDuration(0.75, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
      self.veryHighActivityLabel.alpha = 1
      }) { (finished) -> Void in
        UIView.animateWithDuration(0.75, delay: 6.0, options: nil, animations: { () -> Void in
          self.veryHighActivityLabel.alpha = 0
          }, completion: { (finished) -> Void in
            var maleREE = (self.restEnergyMale().description as NSString).floatValue
            self.getBMI()
            if self.getBMI() < 18.5 {
              self.energyLabel.text = "TEE: \(maleREE * 1.8)-\(maleREE * 2.0)"
              println("Underweight")
            } else if self.getBMI() < 24.9 {
              self.energyLabel.text = "TEE: \(maleREE * 1.7)-\(maleREE * 2.0)"
              println("Normal")
            } else if self.getBMI() < 29.9 {
              self.energyLabel.text = "TEE: \(maleREE * 1.5)-\(maleREE * 1.75)"
              println("Overweight")
            } else {
              self.energyLabel.text = "TEE: \(maleREE * 1.5)-\(maleREE * 1.75)"
              println("Obese")
            }
        })

    }
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SHOW" {
      let resultVC = segue.destinationViewController as! resultsViewController
      resultVC.height = self.heightSlider.value
      resultVC.weight = self.weightTextField.text
      resultVC.age = self.ageTextField.text
    }
  }
  
}