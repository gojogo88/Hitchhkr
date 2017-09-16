//
//  RoundedShadowView.swift
//  Hitchhkr
//
//  Created by Jonathan Go on 2017/09/16.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit

class RoundedShadowView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViewForRoundedandShadow()
    }
    
    func setupViewForRoundedandShadow() {
        self.layer.cornerRadius = 5
        self.layer.shadowOpacity = 0.3
        self.layer.shadowColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
    }

}
