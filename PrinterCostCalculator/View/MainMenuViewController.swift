//
//  MainMenuViewController.swift
//  PrinterCostCalculator
//
//  Created by Neo on 27.08.2022.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var dataModel = DataModel()
        //DataModel.instance.getFilaments()
        //DataModel.instance.getPrinters()
    }
    
    @IBAction func addFilamentButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toFilamentVC", sender: nil)
        
    }
    @IBAction func addPrinterButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toPrinterVC", sender: nil)
        
    }
    
    @IBAction func takeOrderButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toTakeOrderVC", sender: nil)
    }
    
}
