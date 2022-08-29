//
//  PrinterViewController.swift
//  PrinterCostCalculator
//
//  Created by Neo on 28.08.2022.
//

import UIKit

class PrinterViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var dimensionHTextField: UITextField!
    @IBOutlet weak var dimensionWTextField: UITextField!
    @IBOutlet weak var dimensionZTextField: UITextField!
    
    @IBOutlet weak var costPerHourTextField: UITextField!
    
    static var instance : PrinterViewController!
    
    var printerViewModel = PrinterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PrinterViewController.instance = self
    }
    @IBAction func saveButtonClicked(_ sender: Any) {
        printerViewModel.savePrinter()
        
    }
}
