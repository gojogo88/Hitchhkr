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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
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
//        if emailField.text != nil && passwordField.text != nil {
//            authBtn.animateButton(shouldLoad: true, withMessage: nil)
//            self.view.endEditing(true)
//            
//            if let email = emailField.text, let password = passwordField.text {
//                Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
//                    if error != nil {
//                        if let errorCode = AuthErrorCode(rawValue: error!._code) {
//                            switch errorCode {
//                            case .invalidEmail: print("Email invalid. Please try again.")
//                            case .wrongPassword: print("That was the wrong password.")
//                            default: print("An unexpected error occured. Please try again.")
//                            }
//                        } else {
//                            if let user = user {
//                                if self.segmentedControl.selectedSegmentIndex == 0 {
//                                    let userData = ["provider": user.providerID, "userIsDriver": false, "isPickupModeEnabled": false, "driverIsOnTrip": false] as [String: Any]
//                                    loginFireBaseDBUser(uid: user.uid, userData: userData, isDriver: false)
//                                } else {
//                                    let userData = ["provider": user.providerID, "userIsDriver": true, "isPickupModeEnabled": false, "driverIsOnTrip": false] as [String: Any]
//                                    DataService.instance.createFireBaseDBUser(uid: user.uid, userData: userData, isDriver: true)
//                                }
//                            }
//                            print("email user authenticated successfully with Firebase.")
//                            self.dismiss(animated: true, completion: nil)
//                        }
//                    }
//                })
//            }
//        }
    }
    
    func loginFireBaseDBUser(uid: String, userData: Dictionary<String, Any>, isDriver: Bool) {
        if isDriver {
            DataService.sharedInstance.REF_DRIVERS.child(uid).updateChildValues(userData)  //if uid from phone is missing, Firebase will create one
        } else {
            DataService.sharedInstance.REF_USERS.child(uid).updateChildValues(userData)  //will create a user in Firebase
        }
    }
}
