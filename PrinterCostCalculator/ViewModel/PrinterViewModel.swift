//
//  PrinterViewModel.swift
//  PrinterCostCalculator
//
//  Created by Neo on 27.08.2022.
//

import Foundation

class PrinterViewModel : BaseViewModel{
    
    var printer = Printer()
    
    
    func savePrinter(){
        setDataOnObject()
        DataModel.instance.savePrinter(var: printer)
    }
    
    func setDataOnObject(){
    
        
        if(checkDataIsString(var: PrinterViewController.instance.titleTextField) == true){
            printer.title = PrinterViewController.instance.titleTextField.text
        }
        if(checkDataIsString(var: PrinterViewController.instance.brandTextField) == true){
            printer.brand = PrinterViewController.instance.brandTextField.text
        }
        if(checkDataIsString(var: PrinterViewController.instance.modelTextField) == true){
            printer.model = PrinterViewController.instance.modelTextField.text
        }
        if(checkDataIsInt(var: PrinterViewController.instance.dimensionHTextField) == true){
            printer.dimensionH = Int(PrinterViewController.instance.dimensionHTextField.text!)
        }
        if(checkDataIsInt(var: PrinterViewController.instance.dimensionWTextField) == true){
            printer.dimensionW = Int(PrinterViewController.instance.dimensionWTextField.text!)
        }
        if(checkDataIsInt(var: PrinterViewController.instance.dimensionZTextField) == true){
            printer.dimensionZ = Int(PrinterViewController.instance.dimensionZTextField.text!)
        }
    }
    
    
    
}
