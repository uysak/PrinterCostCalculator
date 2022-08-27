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
    
    var takeOrderViewModel = TakeOrderViewModel()
    
    var filamentList : [UIAction] = []
    
    var dataModel : DataModel!
    
    let optionClosure =  { (action : UIAction  )
        in
        print(action.title)}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        takeOrderViewModel = TakeOrderViewModel()
        //filamentList = []
        setSavedFilamentButton()
    }
    
    @IBAction func chooseFilamentClicked(_ sender: Any) {
    }
    
    @IBAction func confirmOrderButtonClicked(_ sender: Any) {
        takeOrderViewModel.jobTime = jobTimeTextField
        takeOrderViewModel.projectName = projectNameTextField
        takeOrderViewModel.filamentAmount = filamentAmountTextField
        takeOrderViewModel.markUp = markUpTextField
        
        takeOrderViewModel.takeOrder()
        
    }
    
    func setSavedFilamentButton(){
        
        print("on db: \(dataModel.filamentList)")
        print("on class: \(filamentList)")
        var index = 0
        filamentList = Array(repeating: UIAction(title: "",state: .on,handler: optionClosure), count: dataModel.filamentList.count)
        
        for filament in dataModel.filamentList{
            filamentList[index] = UIAction(title: filament.title,state: .on,handler : optionClosure)
            index += 1
            
        }
        savedFilamentButton.menu = UIMenu(  children: filamentList)
        
    }
}
