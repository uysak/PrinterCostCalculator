//
//  UserViewModel.swift
//  PrinterCostCalculator
//
//  Created by Neo on 1.09.2022.
//

import Foundation

class UserViewModel : BaseViewModel{
    
    var user = User()
    
    func login(){
        print("login")

            user.email = ViewController.instance.emailTextField.text as! String
            user.password = ViewController.instance.passwordTextField.text as! String
            
                if DataModel.instance.checkLogin(var: user) == true{
                    print("model lgin")
                    ViewController.instance.loginSuccessful()
                }
                else{
                    print("model login fail")
                    ViewController.instance.loginFailed()
                }
        
           
            
        
        
        
    }
    
}
