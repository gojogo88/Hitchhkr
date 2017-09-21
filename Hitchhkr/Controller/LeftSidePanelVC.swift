//
//  LeftSidePanelVC.swift
//  Hitchhkr
//
//  Created by Jonathan Go on 2017/09/17.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit

class LeftSidePanelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signupLoginBtnPressed(_ sender: Any) {
        let signupVC = storyboard?.instantiateViewController(withIdentifier: "SignupVC") as? SignupVC
        if let signupVC = signupVC {
            present(signupVC, animated: true, completion: nil)
        }
    }

    
}
