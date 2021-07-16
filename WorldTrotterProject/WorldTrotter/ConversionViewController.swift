//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Barthelemy, Terry on 2/17/21.
//

import UIKit

class ConversionViewController: UIViewController {

    @IBOutlet var celsiusLabel: UILabel!
    
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
        updateCelsiusLabel()
        
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
     //   celsiusLabel.text = textField.text
        if let text = textField.text, let number = numberFormatter.number(from: text) {
                fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
            } else {
                fahrenheitValue = nil
            }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
         didSet {
             updateCelsiusLabel()
         }
     }
    
   
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }

    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))

        } else {
            celsiusLabel.text = "???"
        }
    }

    let numberFormatter: NumberFormatter = {
      
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
            nf.maximumFractionDigits = 1
            return nf
        }()

    func textField(_ textField: UITextField,shouldChangeCharactersIn range: NSRange,replacementString string: String) -> Bool {
        /*
        let decimalDigits = CharacterSet.decimalDigits
             let decimalSeparator = Locale.current.decimalSeparator ?? "."
             
             for scalar in string.unicodeScalars {
                 if !decimalDigits.contains(scalar) && String(scalar) != decimalSeparator {
                     return false
                 }
             }
             
             let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
            let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
             
             if existingTextHasDecimalSeparator != nil,
                 replacementTextHasDecimalSeparator != nil {
                 return false
             }
             
             return true
            */
        
        
            let currentLocale = Locale.current
            let decimalSeparator = currentLocale.decimalSeparator ?? "."

            let existingTextHasDecimalSeparator
                    = textField.text?.range(of: decimalSeparator)
            let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)

            if existingTextHasDecimalSeparator != nil,
               replacementTextHasDecimalSeparator != nil {
                    return false
                   } else {
                       return true
                   }

       
    }

  
    
}

