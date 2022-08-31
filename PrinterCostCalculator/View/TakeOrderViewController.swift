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
    
    @IBOutlet weak var infoLabel1: UILabel!
    
    @IBOutlet weak var infoLabel2: UILabel!
    
    @IBOutlet weak var infoLabel3: UILabel!
    
    @IBOutlet weak var infoLabel4: UILabel!
    
    @IBOutlet weak var infoLabel5: UILabel!
    
    @IBOutlet weak var infoLabel6: UILabel!
    
    
    var takeOrderViewModel = TakeOrderViewModel()
    
    static var instance : TakeOrderViewController!
    
    var filamentList : [UIAction] = []
    var printerList : [UIAction] = []
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async(){
            DataModel.instance.getPrinters()
            DataModel.instance.getFilaments()
        }
        
        TakeOrderViewController.instance = self
        takeOrderViewModel = TakeOrderViewModel()
        setSavedFilamentButton()
        setSavedPrinterButton()
        infoView.layer.cornerRadius = 45
        
        takeOrderViewModel.choosenPrinterIndex = 0
        takeOrderViewModel.choosenFilamentIndex = 0
        
        DataModel.instance.chooseFilament(var: takeOrderViewModel.choosenFilamentIndex)
        DataModel.instance.choosePrinter(var: takeOrderViewModel.choosenPrinterIndex)
        
    }
    
    @IBAction func okButtonClicked(_ sender: Any) {
        infoView.isHidden = true
    }
    @IBAction func choosePrinterButtonClicked(_ sender: Any) {
        
        
    }

    @IBAction func filamentInfoButtonClicked(_ sender: Any) {
        infoView.isHidden = false
        
        infoLabel1.text = "Title: \(DataModel.instance.choosenFilament.title!)"
        infoLabel2.text = "Filament Type: \(DataModel.instance.choosenFilament.filamentType!)"
        infoLabel3.text = "Diameter: \(DataModel.instance.choosenFilament.diameter!)"
        infoLabel4.text = "Weight: \(DataModel.instance.choosenFilament.weight!)"
        infoLabel5.text = "Cost: \(DataModel.instance.choosenFilament.cost!)"
    }
    @IBAction func printerInfoButtonClicked(_ sender: Any) {
        infoView.isHidden = false
        
        infoLabel1.text = "Title: \(DataModel.instance.choosenPrinter.title!)"
        infoLabel2.text = "Brand: \(DataModel.instance.choosenPrinter.brand!)"
        infoLabel3.text = "Model: \(DataModel.instance.choosenPrinter.model!)"
        infoLabel4.text = "Cost Per Hour: \(DataModel.instance.choosenPrinter.costPerHour!)"
        infoLabel5.text = "Dimensions: \(DataModel.instance.choosenPrinter.dimensionW!) x \(DataModel.instance.choosenPrinter.dimensionZ!) x \(DataModel.instance.choosenPrinter.dimensionH!)"
        
   /*     infoLabel5.text = """
                          Dimensions (W x H x Z): \(DataModel.instance.choosenPrinter.dimensionW) x \(DataModel.instance.choosenPrinter.dimensionH) x
                          \(DataModel.instance.choosenPrinter.dimensionZ)
                          """*/
    }
    
    
    @IBAction func confirmOrderButtonClicked(_ sender: Any) {
        takeOrderViewModel.takeOrder()
        
        takeOrderViewModel.calculate()
        clearTextFields()
        
    }
    
    func setSavedFilamentButton(){
        
        if(DataModel.instance.filamentList.count == 0){
            return
        }
        
        let optionClosure =  { (action : UIAction  )
            in
            
            /*self.takeOrderViewModel.choosenFilamentIndex = self.filamentList.firstIndex(of: action)!
            */
            
            DataModel.instance.chooseFilament(var: self.filamentList.firstIndex(of: action))
            
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
        
        
        let optionClosure =  { (action : UIAction  )
            in
            DataModel.instance.choosePrinter(var: self.printerList.firstIndex(of: action))
            
            
        }
        var index = 0
        printerList = Array(repeating: UIAction(title: "",state: .on,handler: optionClosure), count: DataModel.instance.printerList.count)
        
        for printer in DataModel.instance.printerList{
            printerList[index] = UIAction(title: printer.title,state: .on,handler : optionClosure)
            index += 1
        }
        savedPrinterButton.menu = UIMenu(  children: printerList)
        
    }
    
    func clearTextFields(){
        markUpTextField.text = ""
        jobTimeTextField.text = ""
        projectNameTextField.text = ""
        filamentAmountTextField.text = ""
    }
}
