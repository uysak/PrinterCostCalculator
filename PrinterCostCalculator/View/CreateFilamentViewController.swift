//
//  CreateFilamentViewController.swift
//  PrinterCostCalculator
//
//  Created by Neo on 24.08.2022.
//

import UIKit

class CreateFilamentViewController: UIViewController {

    @IBOutlet weak var chooseFilament: UIButton!
    @IBOutlet weak var chooseDiameter: UIButton!
   
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    var filamentDiameter : String!
    var filamentType : String!
    
    static var instance : CreateFilamentViewController!
    
    var filamentViewModel = FilamentViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CreateFilamentViewController.instance = self
        setFilamentButton()
        setDiameterButton()
    }
    
    func setFilamentButton(){
        
        let optionClosure =  { (action : UIAction  )
            in
            print(action.title)}
        
        chooseFilament.menu = UIMenu(  children: [
            UIAction(title: "PETG", state: .on, handler: optionClosure),
            UIAction(title: "ABS", state: .on, handler: optionClosure),
            UIAction(title: "TPU", state: .on, handler: optionClosure),
            UIAction(title: "PLA", state: .on, handler: optionClosure),
            UIAction(title: "PETT", state: .on, handler: optionClosure),
            UIAction(title: "HIPS", state: .on, handler: optionClosure)])
        
    }
    
    func setDiameterButton(){
        let optionClosure =  { (action : UIAction  )
            in
            self.filamentDiameter = action.title}
        
        chooseDiameter.menu = UIMenu(  children: [
            UIAction(title: "1.75mm2", state: .on, handler: optionClosure),
            UIAction(title: "2.9mm2", state: .on, handler: optionClosure)])
    }
    
    func alert( var title : String, var message : String){
        var alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {

        filamentViewModel.SaveFilament()
        
    }
}
