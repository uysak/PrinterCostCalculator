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
    let database = Firestore.firestore()

    
    func getFilaments(){

        print("cağırıldı")
        database.collection("Users").document(email).collection("Filaments").getDocuments { querysnapshot, err in
            
            if err == nil{
                
                if let querysnapshot = querysnapshot{
                    
                    DispatchQueue.main.async {
                        self.filamentList = querysnapshot.documents.map({
                            filaments in
                            return Filament(id: filaments.documentID, title: filaments["Title"] as! String, filamentType: filaments["Filament Type"] as! String, diameter: filaments["Diameter"] as! String, cost: filaments["Cost"] as! Int, weight: filaments["Weight"] as! Int)
                            
                        })
                    }
                    
                    
                }
                
                
            }
            else{
                print("AAAAAAAAAAAAAAAAAA \(err?.localizedDescription)")
            }
            
        }
        print(filamentList)
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
                "Cost Per Hour": printer.costPerHour
            ]
        )
        
    }
}
