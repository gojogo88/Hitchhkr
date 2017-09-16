//
//  RoundImageView.swift
//  Hitchhkr
//
//  Created by Jonathan Go on 2017/09/16.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupImageView()
    }
    
    func setupImageView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
