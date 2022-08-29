//
//  DataModel.swift
//  PrinterCostCalculator
//
//  Created by Neo on 27.08.2022.
//

import Foundation
import Firebase


class DataModel {

    var email = "berkayuysak4@gmail.com"
    
    var filamentList = [Filament]()
    var printerList = [Printer]()
    
    let database = Firestore.firestore()
    
    static var instance :  DataModel!
    
    init(){
        DataModel.instance = self
        getFilaments()
        getPrinters()
        }
    
    func getFilaments(){
        
        print("cağırıldı")
        database.collection("Users").document(email).collection("Filaments").getDocuments { querysnapshot, err in
            
            if err == nil{
                
                if let querysnapshot = querysnapshot{
                    
                    DispatchQueue.main.async {
                        self.filamentList = querysnapshot.documents.map({
                            filaments in
                            return Filament(id: filaments.documentID, title: filaments["Title"] as? String, filamentType: filaments["Filament Type"] as? String, diameter: filaments["Diameter"] as? String, cost: filaments["Cost"] as? Int, weight: filaments["Weight"] as? Int)
                            
                        })
                    }
                    
                    
                }
                
                
            }
            else{
                print("AAAAAAAAAAAAAAAAAA \(err?.localizedDescription)")
            }
            
        }
    }
    
    func getPrinters(){
        
       
        database.collection("Users").document(email).collection("Printers").getDocuments { querysnapshot, err in
            
            if err == nil{
                
                if let querysnapshot = querysnapshot{
                    
                    DispatchQueue.main.async {
                        self.printerList = querysnapshot.documents.map({
                            printers in
                            return Printer(title: printers["Title"] as! String, id: printers.documentID as! String, brand: printers["Brand"] as! String, model: printers["Model"] as! String, dimensionH: printers["Dimension H"] as! Int, dimensionW: printers["Dimension W"] as! Int, dimensionZ: printers["Dimension Z"] as! Int, costPerHour: printers["Cost Per Hour"] as? Double)
                            
                        })
                    }
                    
                    
                }
                
                
            }
            else{
                print("AAAAAAAAAAAAAAAAAA \(err?.localizedDescription)")
            }
            
        }
    }
    
        func saveFilament(var filament : Filament){
                
                self.database.collection("Users").document(email).collection("Filaments").document().setData(
                [
                    "Title" : filament.title,
                    "Filament Type" : filament.filamentType,
                    "Diameter" : filament.diameter,
                    "Cost" : filament.cost,
                    "Weight" : filament.weight
                
                ])
        }
    
    
    func takeOrder( var order : Order){
        
        self.database.collection("Users").document(self.email).collection("Orders").document().setData(
            
                    [
                        "Filament Amount" : order.filamentAmount,
                        "Job Time"   : order.jobTime,
                        "Mark Up %"  : order.markUp,
                        "Mark Up TL" : "null yet",
                        "Total Cost" : "null yet"
                    ]
            )
    }
    
    func savePrinter( var printer : Printer){
        
        self.database.collection("Users").document(self.email).collection("Printers").document().setData(
            [
                "Title" : printer.title,
                "Brand" : printer.brand,
                "Model" : printer.model,
                "Dimension H" : printer.dimensionH,
                "Dimension W" : printer.dimensionW,
                "Dimension Z" : printer.dimensionZ,
                
                "Cost Per Hour": printer.costPerHour
            ]
        )
        
    }
}
