//
//  SignupVC.swift
//  Hitchhkr
//
//  Created by Jonathan Go on 2017/09/21.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit
import Firebase

class SignupVC: UIViewController, UITextFieldDelegate {

    //Outlets
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var emailField: RoundedCornerTextField!
    @IBOutlet weak var passwordField: RoundedCornerTextField!
    @IBOutlet weak var signinBtn: RoundedShadowButton!
    
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

    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signinBtnPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            signinBtn.animateButton(shouldLoad: true, withMessage: nil)
            self.view.endEditing(true)
            
            if let email = emailField.text, let password = passwordField.text {
                registerUser(withEmail: email, andPassword: password, userCreationComplete: { (success, error) in
                    if success {
                        print("Successfully created a new user in Firebase.")
                        
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        debugPrint(error?.localizedDescription)
                    }
                })
            }
        }
    }
            
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping CompletionHandler) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                if let errorCode = AuthErrorCode(rawValue: error!._code) {
                    switch errorCode {
                    case .invalidEmail: print("Email invalid. Please try again.")
                    case .emailAlreadyInUse: print("Email already in use. Please try again")
                    default: print("An unexpected error occured. Please try again.")
                    }
                }
            } else {
            
                //if a user is returned, we need a constant to hold all the info for the user.  If not, we will handle any errors that we get
                guard let user = user else {
                    userCreationComplete(false, error)
                    return
                }
                //if guard was successful, we create this dictionary then create the DBUser
                if self.segmentedControl.selectedSegmentIndex == 0 {
                    let userData = ["provider": user.providerID, "userIsDriver": false, "isUserIsOnTrip": false] as [String: Any]
                    self.createFireBaseDBUser(uid: user.uid, userData: userData, isDriver: false)
                } else {
                    let userData = ["provider": user.providerID, "userIsDriver": true, "isPickupModeEnabled": false, "isDriverOnTrip": false] as [String: Any]
                    self.createFireBaseDBUser(uid: user.uid, userData: userData, isDriver: true)
                }
            }
            userCreationComplete(true, nil)
        }
    }
    
    func createFireBaseDBUser(uid: String, userData: Dictionary<String, Any>, isDriver: Bool) {
        if isDriver {
            DataService.sharedInstance.REF_DRIVERS.child(uid).updateChildValues(userData)  //if uid from phone is missing, Firebase will create one
        } else {
            DataService.sharedInstance.REF_USERS.child(uid).updateChildValues(userData)  //will create a user in Firebase
        }
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        present(loginVC!, animated: true, completion: nil)
    }
    
}
