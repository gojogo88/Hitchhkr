//
//  RoundedTextField.swift
//  Hitchhkr
//
//  Created by Jonathan Go on 2017/09/19.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit

class RoundedTextField: UITextField {


    override func awakeFromNib() {
        
        self.layer.cornerRadius = 25
        //layer.borderColor = UIColor(red: SHADOW_COLOUR_GREY, green: SHADOW_COLOUR_GREY, blue: SHADOW_COLOUR_GREY, alpha: 0.5).cgColor
        
        //layer.borderWidth = 2.0
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.insetBy(dx: 20, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.insetBy(dx: 20, dy: 0)
    }
    
}
