//
//  RoundedShadowButton.swift
//  Hitchhkr
//
//  Created by Jonathan Go on 2017/09/16.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit

class RoundedShadowButton: UIButton {

    var originalSize: CGRect?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupButtonView()
    }
    
    func setupButtonView() {
        originalSize = self.frame   //to capture the original size of the button
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 10.0
        self.layer.shadowColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize.zero
    }
    
    func animateButton(shouldLoad: Bool, withMessage message: String?) {
        let spinner = UIActivityIndicatorView()   //instantiate a spinner
        spinner.activityIndicatorViewStyle = .whiteLarge
        spinner.color = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        spinner.alpha = 0.0
        spinner.hidesWhenStopped = true
        spinner.tag = 21
        
        if shouldLoad {
            self.addSubview(spinner)
            
            self.setTitle("", for: .normal)
            UIView.animate(withDuration: 0.3, animations: {
                self.layer.cornerRadius = self.frame.height / 2
                self.frame = CGRect(x: self.frame.midX - (self.frame.height / 2), y: self.frame.origin.y, width: self.frame.height, height: self.frame.height)
            }, completion: { (finished) in
                if finished == true {
                    spinner.startAnimating()
                    spinner.center = CGPoint(x: self.frame.width / 2 + 1, y: self.frame.width / 2 + 1)
                    UIView.animate(withDuration: 0.3, animations: {
                        spinner.alpha = 1.0
                    })
                }
            })
            self.isUserInteractionEnabled = false
        } else {   //if loading is finished
            self.isUserInteractionEnabled = true
            
            for subview in self.subviews {
                if subview.tag == 21 {
                    subview.removeFromSuperview()
                }
            }
            UIView.animate(withDuration: 0.3, animations: {
                self.layer.cornerRadius = 5.0
                self.frame = self.originalSize!
                self.setTitle(message, for: .normal)
            })
        }
    }

}
