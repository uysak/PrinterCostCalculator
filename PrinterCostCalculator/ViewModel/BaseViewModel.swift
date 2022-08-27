//
//  BaseViewModel.swift
//  PrinterCostCalculator
//
//  Created by Neo on 27.08.2022.
//

import Foundation
import UIKit


class BaseViewModel{
    
    
    
    func checkDataIsString(var textField : UITextField) -> Bool{
        
        if textField.text == ""{
            //createFilamentViewController.alert(var: "Error", var: "\(textField.placeholder) cant to be empty")
            return false
        }
        
        else{
            if let text = textField.text as? String  {
                return true
            }
            else{
                //createFilamentViewController.alert(var: "Error", var: "\(textField.placeholder) must to be String")
                return false
            }
        }
    }
    func checkDataIsInt(var textField : UITextField) -> Bool{
        
        if textField.text == ""{
            //createFilamentViewController.alert(var: "Error", var: "\(textField.placeholder) cant to be empty")
            return false
        }
        
        else{
            if let text = Int(textField.text!) as? Int{
                return true
            }
            else{
              //  createFilamentViewController.alert(var: "Error", var: "\(textField.placeholder) must to be Integer")
                return false
            }
        }
    }
}
