//
//  ViewController.swift
//  PrinterCostCalculator
//
//  Created by Neo on 24.08.2022.
//

import UIKit
import SwiftUI

var isPasswordShowing = false

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var showPassword: UIButton!
    
    @IBOutlet weak var signInView: UIView!
    
    @IBOutlet weak var signUpView: UIView!
    static var instance :  ViewController!
    
    var userViewModel : UserViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var dataModel = DataModel()
        //DataModel.instance.getFilaments()
        //DataModel.instance.getPrinters()
        signUpView.layer.cornerRadius = 30
        signInView.layer.cornerRadius = 30
        ViewController.instance = self
        userViewModel = UserViewModel()
    }
    
    
    
    
    
    @IBAction func showPasswordClicked(_ sender: Any) {
        
        if(isPasswordShowing == false){
            
            showPassword.setBackgroundImage(UIImage(systemName: "eye.fill"), for: .normal)
            
            passwordTextField.isSecureTextEntry = false
            isPasswordShowing = true
        }
            else{
                showPassword  .setBackgroundImage(UIImage(systemName: "eye"), for: .selected)
                
                passwordTextField.isSecureTextEntry = true
                isPasswordShowing = false
                
            }
        
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        self.userViewModel.login()
    }
    
    func alert(var title : String!,var message : String!){
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        
        present(alert, animated: true)
    }
    
    func loginSuccessful(){
        print("segue")
        performSegue(withIdentifier: "toMainMenuVC", sender: nil)

    }
    
    func loginFailed(){
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
}

