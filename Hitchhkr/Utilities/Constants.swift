//
//  Constants.swift
//  Hitchhkr
//
//  Created by Jonathan Go on 2017/09/19.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import Foundation
import Firebase

//URL Constants
let DB_BASE = Database.database().reference()

typealias CompletionHandler = (_ Success: Bool, _ error: Error?) -> ()
