//
//  EnergyViewController.swift
//  NewMacroCalculator
//
//  Created by RYAN CHRISTENSEN on 4/16/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class EnergyViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
  
  @IBOutlet weak var heightSlider: UISlider!
  @IBOutlet weak var heightLabel: UILabel!
  @IBOutlet weak var weightTextField: UITextField!
  @IBOutlet weak var energyLabel: UILabel!
  @IBOutlet weak var ageTextField: UITextField!
  @IBOutlet weak var usualWeightTextField: UITextField!
  @IBOutlet weak var activityButton: UIButton!
  @IBOutlet weak var resultsButton: UIButton!
  @IBOutlet weak var activityPicker: UIPickerView!
  
  let activity = ["Bed Ridden", "Sedentary", "Light Activity", "Moderate Activity", "High Activity", "Very High Activity"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.weightTextField.delegate = self
      self.activityPicker.dataSource = self
      self.activityPicker.delegate = self
      self.activityPicker.alpha = 0
      self.resultsButton.alpha = 0
      self.energyLabel.alpha = 0
//      self.heightSlider.layer.shadowColor = UIColor.blackColor().CGColor
//      self.heightSlider.layer.shadowOffset = CGSizeMake(0, 5)
//      self.heightSlider.layer.shadowOpacity = 0.4
//      self.activityPicker.layer.shadowColor = UIColor.blackColor().CGColor
//      self.activityPicker.layer.shadowOffset = CGSizeMake(0, 5)
//      self.activityPicker.layer.shadowOpacity = 0.4
      
    }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.activityButton.alpha = 1
    self.activityPicker.alpha = 0
    self.resultsButton.alpha = 0
  }
  
  override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    self.weightTextField.resignFirstResponder()
    self.ageTextField.resignFirstResponder()
    self.usualWeightTextField.resignFirstResponder()
  }
  
  @IBAction func undoButton(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  func getBMI() -> Float {
    var currentValue = round(self.heightSlider.value)
    var BMI = (((weightTextField.text as NSString).floatValue) * 703) / (currentValue * currentValue)
    return BMI
  }
  
  func getIBW() -> Float {
    var heightFactor = abs(round(self.heightSlider.value) - 60.0)
    var weightAddition = 6.0 * heightFactor
    var IBW = weightAddition + 106.0
    return IBW
  }
  
  func restEnergyMale() -> Float{
    var currentValue = round(self.heightSlider.value)
    var heightInCM = currentValue * 2.54
    var weightInKG = (self.weightTextField.text as NSString).floatValue / 2.2
    var age = (self.ageTextField.text as NSString).floatValue
    var restEnergyEstimate = (10 * weightInKG) + (6.25 * heightInCM) - (5 * age) + 5
    return restEnergyEstimate
  }
  

  @IBAction func heightSliderChanged(sender: AnyObject) {
    var currentValue = Int(round(self.heightSlider.value))
    self.heightLabel.text = "\(currentValue)\""
  }
  
  @IBAction func activityPickerButton(sender: AnyObject) {
    var ree = (self.restEnergyMale().description as NSString).floatValue
    self.restEnergyMale()
    self.energyLabel.text = "\(ree)"
    UIView.animateWithDuration(0.6, animations: { () -> Void in
      self.activityButton.alpha = 0
      self.activityPicker.alpha = 1
      self.resultsButton.alpha = 1
    })
  }

  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return self.activity.count
  }
  
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
    return self.activity[row]
  }
  
  func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //self.restEnergyMale()
    var maleREE = (self.restEnergyMale().description as NSString).floatValue
    if row == 0 {
      if self.getBMI() < 18.5 {
        self.energyLabel.text = "\(maleREE * 1.2)-\(maleREE * 1.3)"
      } else if self.getBMI() < 24.9 {
        self.energyLabel.text = "\(maleREE * 1.0)-\(maleREE * 1.1)"
      } else if self.getBMI() < 29.9 {
        self.energyLabel.text = "\(maleREE * 1.0)"
      } else {
        self.energyLabel.text = "\(maleREE * 1.0)"
      }
    } else if row == 1 {
      if self.getBMI() < 18.5 {
        self.energyLabel.text = "\(maleREE * 1.3)-\(maleREE * 1.4)"
      } else if self.getBMI() < 24.9 {
        self.energyLabel.text = "\(maleREE * 1.2)-\(maleREE * 1.3)"
      } else if self.getBMI() < 29.9 {
        self.energyLabel.text = "\(maleREE * 1.1)-\(maleREE * 1.2)"
      } else {
        self.energyLabel.text = "\(maleREE * 1.1)-\(maleREE * 1.2)"
      }
    } else if row == 2 {
      if self.getBMI() < 18.5 {
        self.energyLabel.text = "\(maleREE * 1.4)-\(maleREE * 1.5)"
      } else if self.getBMI() < 24.9 {
        self.energyLabel.text = "\(maleREE * 1.3)-\(maleREE * 1.4)"
      } else if self.getBMI() < 29.9 {
        self.energyLabel.text = "\(maleREE * 1.2)-\(maleREE * 1.3)"
      } else {
        self.energyLabel.text = "\(maleREE * 1.2)-\(maleREE * 1.3)"
      }
    } else if row == 3 {
      if self.getBMI() < 18.5 {
        self.energyLabel.text = "\(maleREE * 1.5)-\(maleREE * 1.6)"
      } else if self.getBMI() < 24.9 {
        self.energyLabel.text = "\(maleREE * 1.4)-\(maleREE * 1.5)"
      } else if self.getBMI() < 29.9 {
        self.energyLabel.text = "\(maleREE * 1.3)-\(maleREE * 1.4)"
      } else {
        self.energyLabel.text = "\(maleREE * 1.3)-\(maleREE * 1.4)"
      }
    } else if row == 4 {
      if self.getBMI() < 18.5 {
        self.energyLabel.text = "\(maleREE * 1.6)-\(maleREE * 1.8)"
      } else if self.getBMI() < 24.9 {
        self.energyLabel.text = "\(maleREE * 1.5)-\(maleREE * 1.6)"
      } else if self.getBMI() < 29.9 {
        self.energyLabel.text = "\(maleREE * 1.4)-\(maleREE * 1.5)"
      } else {
        self.energyLabel.text = "\(maleREE * 1.4)-\(maleREE * 1.5)"
      }
    } else {
      if self.getBMI() < 18.5 {
        self.energyLabel.text = "\(maleREE * 1.8)-\(maleREE * 2.0)"
      } else if self.getBMI() < 24.9 {
        self.energyLabel.text = "\(maleREE * 1.7)-\(maleREE * 2.0)"
      } else if self.getBMI() < 29.9 {
        self.energyLabel.text = "\(maleREE * 1.5)-\(maleREE * 1.75)"
      } else {
        self.energyLabel.text = "\(maleREE * 1.5)-\(maleREE * 1.75)"
      }
    }
    self.getIBW()
  }

  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SHOW" {
      let resultVC = segue.destinationViewController as! resultsViewController
      resultVC.height = self.heightSlider.value
      resultVC.weight = self.weightTextField.text
      resultVC.age = self.ageTextField.text
      resultVC.usualWeight = self.usualWeightTextField.text
      resultVC.teeLow = self.energyLabel.text
      resultVC.IBW = self.getIBW().description
      resultVC.BMI = self.getBMI().description
      resultVC.REE = self.restEnergyMale().description
    }
  }
}