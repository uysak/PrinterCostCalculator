//
//  TakeOrderViewController.swift
//  PrinterCostCalculator
//
//  Created by Neo on 25.08.2022.
//

import UIKit

class TakeOrderViewController: UIViewController {

    @IBOutlet weak var projectNameTextField: UITextField!
    @IBOutlet weak var filamentAmountTextField: UITextField!
    @IBOutlet weak var markUpTextField: UITextField!
    @IBOutlet weak var jobTimeTextField: UITextField!
    @IBOutlet weak var savedFilamentButton: UIButton!
    @IBOutlet weak var savedPrinterButton: UIButton!
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoText: UILabel!
    
    
    var takeOrderViewModel = TakeOrderViewModel()
    
    static var instance : TakeOrderViewController!
    
    var filamentList : [UIAction] = []
    var printerList : [UIAction] = []
    
    let optionClosure =  { (action : UIAction  )
        in
        print(action.title)}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TakeOrderViewController.instance = self
        takeOrderViewModel = TakeOrderViewModel()
        setSavedFilamentButton()
        setSavedPrinterButton()
    }
    @IBAction func filamentInfoButtonClicked(_ sender: Any) {
        infoView.isHidden = false
        var str = "test 1 \n " + "test2 \n "
        infoText.text = str
        
        
        
    }
    
    @IBAction func chooseFilamentClicked(_ sender: Any) {
    }
    
    @IBAction func confirmOrderButtonClicked(_ sender: Any) {
        takeOrderViewModel.takeOrder()
    }
    
    func setSavedFilamentButton(){
        
        if(DataModel.instance.filamentList.count == 0){
            return
        }

        var index = 0
        filamentList = Array(repeating: UIAction(title: "",state: .on,handler: optionClosure), count: DataModel.instance.filamentList.count)
        
        for filament in DataModel.instance.filamentList{
            filamentList[index] = UIAction(title: filament.title,state: .on,handler : optionClosure)
            index += 1
            
        }
        savedFilamentButton.menu = UIMenu(  children: filamentList)
        
    }
    
    func setSavedPrinterButton(){

        if(DataModel.instance.printerList.count == 0){
            return
        }
        var index = 0
        printerList = Array(repeating: UIAction(title: "",state: .on,handler: optionClosure), count: DataModel.instance.printerList.count)
        
        for printer in DataModel.instance.printerList{
            printerList[index] = UIAction(title: printer.title,state: .on,handler : optionClosure)
            index += 1
        }
        savedPrinterButton.menu = UIMenu(  children: printerList)
        
    }
}
