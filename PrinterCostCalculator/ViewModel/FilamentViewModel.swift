//
//  FilamentViewModel.swift
//  PrinterCostCalculator
//
//  Created by Neo on 25.08.2022.
//

import Foundation
import UIKit


class FilamentViewModel : BaseViewModel{
    
    var filament : Filament!
    var firebase : Firebase!

    
    var createFilamentVC = CreateFilamentViewController()
    
    override init() {
         firebase = Firebase()
    }
    
   
    
    func SaveFilament(){
        setDataOnObj()
        firebase.saveFilament(var : filament)
    }
    
    func setDataOnObj(){
        
        filament = Filament()
        
        if checkDataIsString(var: createFilamentVC.titleTextField) == true{
            
            filament.title = createFilamentVC.titleTextField.text
        }
        
        if checkDataIsInt(var: createFilamentVC.costTextField) == true{
            filament.cost = Int(createFilamentVC.costTextField.text!)
        }
        if checkDataIsInt(var: createFilamentVC.weightTextField) == true {
            filament.weight = Int(createFilamentVC.weightTextField.text!)
        }
        filament.filamentType = createFilamentVC.filamentType
        filament.diameter = createFilamentVC.filamentDiameter
    }
}
