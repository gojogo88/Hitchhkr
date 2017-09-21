//
//  LoginVC.swift
//  Hitchhkr
//
//  Created by Jonathan Go on 2017/09/17.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController, UITextFieldDelegate {

    //outlets
    @IBOutlet weak var emailField: RoundedCornerTextField!
    @IBOutlet weak var authBtn: RoundedShadowButton!
    @IBOutlet weak var passwordField: RoundedCornerTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.bindToKeyboard()
        emailField.delegate = self
        passwordField.delegate = self
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap(sender:)))
        self.view.addGestureRecognizer(tap)
    }

    @objc func handleScreenTap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func authBtnPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            authBtn.animateButton(shouldLoad: true, withMessage: nil)
            self.view.endEditing(true)
            
            if let email = emailField.text, let password = passwordField.text {
                loginUser(withEmail: email, andPassword: password, loginComplete: { (success, error) in
                    self.dismiss(animated: true, completion: nil)
                    print("Successfully registered User")
                })
                
            }
        }
    }
    
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping CompletionHandler) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                if let errorCode = AuthErrorCode(rawValue: error!._code) {
                    switch errorCode {
                    case .invalidEmail: print("Email invalid. Please try again.")
                    case .wrongPassword: print("That was the wrong password.")
                    default: print("An unexpected error occured. Please try again.")
                    }
                }
            }
            loginComplete(true, nil)
        }
    }
}
