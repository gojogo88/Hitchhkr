//
//  CenterVCDelegate.swift
//  Hitchhkr
//
//  Created by Jonathan Go on 2017/09/17.
//  Copyright © 2017 Appdelight. All rights reserved.
//

//swift file
import UIKit

//1. toggle the left panel
//2. add the left side panel beneath the sliding controller
//3. animate it

protocol  CenterVCDelegate {
    func toggleLeftPanel()
    func addLeftPanelViewController()
    func animateLeftPanel(shouldExpand: Bool)
}

