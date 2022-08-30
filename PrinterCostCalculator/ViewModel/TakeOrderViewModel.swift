//
//  TakeOrderViewModel.swift
//  PrinterCostCalculator
//
//  Created by Neo on 25.08.2022.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseFirestoreSwift
import FirebaseFirestore

class TakeOrderViewModel : BaseViewModel{

    
    var order = Order()
    
    var choosenFilamentIndex = 0
    var choosenPrinterIndex = 0
    
    func takeOrder(){
        setDataOnObject()
        DataModel.instance.takeOrder(var: order)
    }
    
    
    func getChoosenFilament() -> DocumentSnapshot {
        
        DataModel.instance.chooseFilament(var: choosenFilamentIndex)
        return DataModel.instance.document
    }
    
    func setDataOnObject(){

        
        if ( checkDataIsString(var: TakeOrderViewController.instance.projectNameTextField) == true){
            order.projectName = TakeOrderViewController.instance.projectNameTextField.text
        }
        if (checkDataIsInt(var: TakeOrderViewController.instance.filamentAmountTextField) == true){
            order.filamentAmount = Int(TakeOrderViewController.instance.filamentAmountTextField.text!)
        }
        if (checkDataIsInt(var: TakeOrderViewController.instance.markUpTextField) == true){
            order.markUp = Int(TakeOrderViewController.instance.markUpTextField.text!)
        }
        if(checkDataIsInt(var: TakeOrderViewController.instance.jobTimeTextField) == true){
            order.jobTime = Int(TakeOrderViewController.instance.jobTimeTextField.text!)
        }
    }
}
