//
//  RoundedCornerTextField.swift
//  Hitchhkr
//
//  Created by Jonathan Go on 2017/09/17.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit

class RoundedCornerTextField: UITextField {
    
//    var textRectOffset: CGFloat = 20

    override func awakeFromNib() {
        super.awakeFromNib()

        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        //layer.borderColor = UIColor(red: SHADOW_COLOUR_GREY, green: SHADOW_COLOUR_GREY, blue: SHADOW_COLOUR_GREY, alpha: 0.5).cgColor
        
        //layer.borderWidth = 2.0
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 0)
//        return CGRect(x: 0 + textRectOffset, y: 0 + (textRectOffset / 2), width: self.frame.width - textRectOffset, height: self.frame.height + textRectOffset)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 0)
//        return CGRect(x: 0 + textRectOffset, y: 0 + (textRectOffset / 2), width: self.frame.width - textRectOffset, height: self.frame.height + textRectOffset)
    }
}
    


    




