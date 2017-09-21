//
//  AuthService.swift
//  Hitchhkr
//
//  Created by Jonathan Go on 2017/09/21.
//  Copyright © 2017 Appdelight. All rights reserved.
//

//swift file.  singleton class
import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    private init() {}
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping CompletionHandler) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                loginComplete(false, error)
                return
            }
            loginComplete(true, nil)
        }
    }
}
