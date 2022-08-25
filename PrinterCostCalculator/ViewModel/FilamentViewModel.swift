//
//  FilamentViewModel.swift
//  PrinterCostCalculator
//
//  Created by Neo on 25.08.2022.
//

import Foundation
import UIKit


class FilamentViewModel{
    
    var filament : Filament!
    var firebase : Firebase!
    
    var titleTextField : UITextField!
    var filamentType : String!
    var costTextField : UITextField!
    var weightTextField : UITextField!
    var filamentDiameter : String!
    
    init() {
         filament = Filament()
         firebase = Firebase()
        
        
    }
    
   
    
    func SaveFilament(){
        setDataOnObj(var: filament)
        firebase.saveFilament(var : filament)
    }
    
    func setDataOnObj(var filamentObj : Filament){
        
        if checkDataIsString(var: titleTextField) == true{
            
            filamentObj.title = titleTextField.text
        }
        
        if checkDataIsInt(var: costTextField) == true{
            filamentObj.cost = Int(costTextField.text!)
        }
        if checkDataIsInt(var: weightTextField) == true {
            filamentObj.weight = Int(weightTextField.text!)
        }
        filamentObj.filamentType = filamentType
        filamentObj.diameter = filamentDiameter
    }

    
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
