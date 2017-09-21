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
    static let sharedInstance = DataService()
    //static - when its instantiated, it is available for the entire lifecyle of the app. We can aceess it from anywhere in the app
    private init() {}
    
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
}
