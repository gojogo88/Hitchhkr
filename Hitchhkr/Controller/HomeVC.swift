//
//  ViewController.swift
//  Hitchhkr
//
//  Created by Jonathan Go on 2017/09/16.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit
import MapKit
import RevealingSplashView

class HomeVC: UIViewController, MKMapViewDelegate {

    //Outlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var actionBtn: RoundedShadowButton!
    
    //variables
    var delegate: CenterVCDelegate?
    let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "launchScreenIcon")!, iconInitialSize: CGSize(width: 80, height: 80), backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))   //launchscreen animation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.heartBeat
        revealingSplashView.startAnimation()
    
        revealingSplashView.heartAttack = true
    }

    @IBAction func actionBtnPressed(_ sender: Any) {
        actionBtn.animateButton(shouldLoad: true, withMessage: nil)
    }
    
    @IBAction func menuBtnPressed(_ sender: Any) {
        delegate?.toggleLeftPanel()
    }
    

}

