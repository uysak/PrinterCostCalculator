//
//  MainMenuViewController.swift
//  PrinterCostCalculator
//
//  Created by Neo on 27.08.2022.
//

import UIKit

class MainMenuViewController: UIViewController {

    var dataModel = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataModel.getFilaments()
    }
    
    @IBAction func addFilamentButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toFilamentVC", sender: nil)
        
    }
    
    @IBAction func takeOrderButtonClicked(_ sender: Any) {
        print("aa \(dataModel.filamentList)")
        performSegue(withIdentifier: "toTakeOrderVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTakeOrderVC"{
            var destination = segue.destination as! TakeOrderViewController
            destination.dataModel = self.dataModel
        }
        
    }


}
