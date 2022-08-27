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
    
    func saveFilament(var filament : Filament!){
        
        var title = filament.title!
        var filamentType = filament.filamentType
        var diameter = filament.diameter!
        var cost = filament.cost!
        var weight = filament.weight!
        print(title)
        
        self.db.collection("Users").document(email).collection("Filaments").document().setData(
        [
            "Title" : title,
            "Filament Type" : filamentType,
            "Diameter" : diameter,
            "Cost" : cost,
            "Weight" : weight
        
        ])
    }
    
    func takeOrder(var order : Order){
        var projectName = order.projectName
        var filamentAmount = order.filamentAmount
        var markUp = order.markUp
        var jobTime = order.jobTime
        
        self.db.collection("Users").document(email).collection("Orders").document().setData(
        
                [
                "Filament Amount" : filamentAmount,
                "Job Time"   : jobTime,
                "Mark Up %"  : markUp,
                "Mark Up TL" : "null yet",
                "Total Cost" : "null yet"
                ]
        )
    }
    
}


