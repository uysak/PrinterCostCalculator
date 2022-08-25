//
//  Firebase.swift
//  PrinterCostCalculator
//
//  Created by Neo on 24.08.2022.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import UIKit


class Firebase{
    
    var db : Firestore!
    var email = "berkayuysak4@gmail.com"
    
    init() {
        db = Firestore.firestore()
         
        let settings = Firestore.firestore().settings
        settings.cacheSizeBytes = FirestoreCacheSizeUnlimited
        Firestore.firestore().settings = settings
    }
    
    func SignUp(){
        
        
        //var ref: DocumentReference? = nil
        
        
        var refCustomers = self.db.collection("Users").document(email).collection("Customers")
        var refAllOrders = self.db.collection("Users").document(email).collection("AllOrders")
        
        
    }
    
    func saveFilament(var filament : Filament!){
        
        var title = filament.title!
        var filamentType = filament.filamentType
        var diameter = filament.diameter!
        var cost = filament.cost!
        var weight = filament.weight!
        print(title)
        
        self.db.collection("Users").document(email).collection("Filaments").document(title).setData(
        [
            "Filament Type: " : filamentType,
            "Diameter : " : diameter,
            "Cost: " : cost,
            "Weight" : weight
        
        ])
    }
        
      //  self.db.collection("Users").document(email).collection("Customers").document("test").
      //  self.db.collection("Users").document(email).collection("Orders").document("test2").delete()
        
  /*      var ref : DocumentReference? = nil
        ref = self.db.collection("Filaments").addDocument(data: ["first" : "Ada"])
        { err in
           if let err = err {
           print("Error adding document: \(err)")
           }
           else{
               print("Document added with ID: \(ref!.documentID)")
                }
        }*/
}


