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

    
    override init() {
         firebase = Firebase()
    }

    func SaveFilament(){
        setDataOnObj()
        DataModel.instance.saveFilament(var : filament)
    }
    
    func setDataOnObj(){
        
        filament = Filament()
        
        if checkDataIsString(var: CreateFilamentViewController.instance.titleTextField) == true{
            
            filament.title = CreateFilamentViewController.instance.titleTextField.text
        }
        
        if checkDataIsInt(var: CreateFilamentViewController.instance.costTextField) == true{
            filament.cost = Int(CreateFilamentViewController.instance.costTextField.text!)
        }
        if checkDataIsInt(var: CreateFilamentViewController.instance.weightTextField) == true {
            filament.weight = Int(CreateFilamentViewController.instance.weightTextField.text!)
        }
        filament.filamentType = CreateFilamentViewController.instance.chooseFilament.currentTitle
        filament.diameter = CreateFilamentViewController.instance.chooseDiameter.currentTitle
    }
}
