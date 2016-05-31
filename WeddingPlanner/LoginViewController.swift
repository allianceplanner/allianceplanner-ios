//
//  MainViewController.swift
//  WeddingPlanner
//
//  Created by Felipe Assunção on 4/19/16.
//  Copyright © 2016 Felipe Assunção. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: BaseViewController {
    
    // Summary: IBOulets
    // IBOulets,.
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var warnLabel: UILabel!
    
    override func viewDidLoad() {
        
        enableNavigation = false;
        warningLabel = warnLabel
        
        super.viewDidLoad()
    }
    
    @IBAction func OnLogin(sender: UIButton) {
        
        self.dismissWarn()
        
        if validateLogin() {
            
            self.login()
//            FIRAuth.auth()?.createUserWithEmail(userTextField.text!, password: passTextField.text!, completion: {
//                user, error in
//                
//                if error == nil
//                {
//                    self.login()
//                } else {
//                    self.createWarn(error?.localizedDescription)
//                }
//            })
        }
    }
    
    @IBAction func OnRegister(sender: AnyObject) {
        //self.RecirectToController(Controller.Register, keepMenu: false)
    }
    
    func login () {
        
        FIRAuth.auth()?.signInWithEmail(userTextField.text!, password: passTextField.text!, completion: {
            user, error in
            if error == nil {
                UserDomain.user = user
                self.RecirectToController(Controller.Main, keepMenu: false)
            } else {
                self.createWarn(error?.localizedDescription)
            }
        })
    }

    
    
    
    // Summary: Functions
    // Func,
    // Validate Login, returns the user login validation result.
    func validateLogin () -> Bool {
        
        activityIndicator.startAnimating()
        
        var canLogin = true
    
        if !(userTextField.text?.IsEmail())! {
            canLogin = false
        }
        
        if !(passTextField.text?.IsPassword())! {
            canLogin = false
        }
        
        if !canLogin {
            createWarn("Usuário ou senha inválidos")
        }
        
        // Produces an small delay before stop the animation against
        let timer = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC)))
        dispatch_after(timer, dispatch_get_main_queue()){
            self.activityIndicator.stopAnimating()
        }
        
        return canLogin
    }
}
