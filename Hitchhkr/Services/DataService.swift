//
//  DataService.swift
//  Hitchhkr
//
//  Created by Jonathan Go on 2017/09/19.
//  Copyright © 2017 Appdelight. All rights reserved.
//
//swift file
import Foundation
import Firebase



class DataService {
    static let instance = DataService()
    //static - when its instantiated, it is available for the entire lifecyle of the app. We can aceess it from anywhere in the app
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")  //adding a table in the DB (like a folder in a dir)
    private var _REF_DRIVERS = DB_BASE.child("drivers")
    private var _REF_TRIPS = DB_BASE.child("trips")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_DRIVERS: DatabaseReference {
        return _REF_DRIVERS
    }
    
    var REF_TRIPS: DatabaseReference {
        return _REF_TRIPS
    }
    
    //to create a FireBase user, we need to pass in a UID, dictionary of user data (email, acct type, pswd), property to check if they are a driver, property to see if they are on a trip or not...
    func createFireBaseDBUser(uid: String, userData: Dictionary<String, Any>, isDriver: Bool) {
        if isDriver {  //will create a driver in Firebase
            REF_DRIVERS.child(uid).updateChildValues(userData)  //if uid from phone is missing, Firebase will create one
        } else {
            REF_USERS.child(uid).updateChildValues(userData)  //will create a user in Firebase
        }
    }
}
