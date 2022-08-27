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

    var dataModel = DataModel()
    
    var order = Order()
    var takeOrderVC = TakeOrderViewController()
    
    func takeOrder(){
        setDataOnObject()
        dataModel.takeOrder(var: order)
    }
    
    func setDataOnObject(){
        
        if ( checkDataIsString(var: takeOrderVC.projectNameTextField) == true){
            order.projectName = takeOrderVC.projectNameTextField.text
        }
        if (checkDataIsInt(var: takeOrderVC.filamentAmountTextField) == true){
            order.filamentAmount = Int(takeOrderVC.filamentAmountTextField.text!)
        }
        if (checkDataIsInt(var: takeOrderVC.markUpTextField) == true){
            order.markUp = Int(takeOrderVC.markUpTextField.text!)
        }
        if(checkDataIsInt(var: takeOrderVC.jobTimeTextField) == true){
            order.jobTime = Int(takeOrderVC.jobTimeTextField.text!)
        }
    }
}
