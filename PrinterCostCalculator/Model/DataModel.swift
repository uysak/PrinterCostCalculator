//
//  DataModel.swift
//  PrinterCostCalculator
//
//  Created by Neo on 27.08.2022.
//

import Foundation
import Firebase
import FirebaseFirestore

class DataModel {

    var email = "berkayuysak4@gmail.com"
    
    var filamentList = [Filament]()
    var printerList = [Printer]()
    
    
    let database = Firestore.firestore()
    
    var document : DocumentSnapshot!
    
    var choosenFilament = Filament()
    var choosenPrinter = Printer()
    
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
                print("tamamlandi")
            }
            else{
                print("AAAAAAAAAAAAAAAAAA \(err?.localizedDescription)")
            }
            
        }
    }
    func chooseFilament( var index : Int!){
        
        let docRef = self.database.collection("Users").document(email).collection("Filaments").document(filamentList[index].id)
    
        
        docRef.getDocument { (document, err) in
            
                if let document = document, document.exists{
                    let _data = document.data().map(String.init(describing:)) ?? "nil"
                    
                    self.choosenFilament.weight = document.data()!["Weight"] as! Int
                    self.choosenFilament.cost = document.data()!["Cost"] as! Int
                    self.choosenFilament.diameter = document.data()!["Diameter"] as! String
                    self.choosenFilament.filamentType = document.data()!["Filament Type"] as! String
                    self.choosenFilament.id = document.documentID
                    self.choosenFilament.title = document.data()!["Title"] as! String
                    
                    print(self.choosenFilament.diameter)
                    
                    
                }
            }
        
                
    }
    
    func choosePrinter(var index : Int!){
        
        if(printerList.count == 0){
            return
        }
        let docRef = self.database.collection("Users").document(email).collection("Printers").document(printerList[index].id)
        
        docRef.getDocument { (document, err) in
            if let document = document, document.exists{
                
                let data = document.data().map(String.init(describing:)) ?? "nil"
                
                self.choosenPrinter.id = document.documentID
                self.choosenPrinter.title = document.data()!["Title"] as! String
                self.choosenPrinter.brand = document.data()!["Brand"] as! String
                self.choosenPrinter.model = document.data()!["Model"] as! String
                self.choosenPrinter.costPerHour = 2 as! Int
                self.choosenPrinter.dimensionW = document.data()!["Dimension W"] as! Int
                self.choosenPrinter.dimensionH = document.data()!["Dimension H"] as! Int
                self.choosenPrinter.dimensionZ = document.data()!["Dimension Z"] as! Int
                
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
                            return Printer(title: printers["Title"] as? String, id: printers.documentID as! String, brand: printers["Brand"] as! String, model: printers["Model"] as! String, dimensionH: printers["Dimension H"] as! Int, dimensionW: printers["Dimension W"] as! Int, dimensionZ: printers["Dimension Z"] as! Int, costPerHour: printers["Cost Per Hour"] as? Int )
                            
                        })
                    }
                    
                    
                }
                
                
            }
            else{
                print("Err \(err?.localizedDescription)")
            }
            
        }
    }
    func checkLogin(var user : User) -> Bool{
        var check = false
        let docRef = self.database.collection("Users").document(user.email)
        
        docRef.getDocument { querysnapshot, err in
            
            if let querysnapshot = querysnapshot{
                print("aaa \(querysnapshot.documentID)")
                
                
                /// email check
                if querysnapshot.documentID == user.email{
                    print("mail doğru")
                    docRef.getDocument { snapshot, err in
                    /// password check
                        
                        if let snapshot = snapshot{
                            print(snapshot.get("password"))
                            if let passw = snapshot.get("password") as? String{
                            
                                if passw == user.password!{
                                    print("giris")
                                    ViewController.instance.loginSuccessful()
                                    check = true
                                }
                                else{
                                    ViewController.instance.alert(var: "Error", var: "Wrong Password")
                                    check = false
                                }
                            }
                        }
                    }
                }
                else{
                    ViewController.instance.alert(var: "Error", var: "No registered user found with this email")
                    check = false
                }
                
            }
        }
        print(check)
        return check
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
