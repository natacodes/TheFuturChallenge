//
//  Day8ViewController.swift
//  AnimationChallenge
//
//  Created by Nataliia Koldaeva on 9/30/17.
//  Copyright © 2017 Nataliia Koldaeva. All rights reserved.
//

import Foundation
import UIKit

class Day8ViewController: UIViewController {
    
    @IBOutlet var appearingView: UIView!
    @IBOutlet var appearingViewHeight: NSLayoutConstraint!
    @IBOutlet var appearingViewWidth: NSLayoutConstraint!
    @IBOutlet var appearingViewCenterYtoStableView: NSLayoutConstraint!
    @IBOutlet var appearingViewVerticalSpacetoStableView: NSLayoutConstraint!
    
    
    @IBOutlet var stableView: UIView!
    @IBOutlet var stableViewBottom: NSLayoutConstraint!
    
    @IBAction func triggerButton(_ sender: UIButton) {
        appearingView.isHidden = false
        appearingViewHeight.constant = 60
        appearingViewWidth.constant = 200
        appearingViewCenterYtoStableView.isActive = false
        appearingViewVerticalSpacetoStableView.isActive = true
        appearingViewVerticalSpacetoStableView.constant = 15
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        })
        self.appearingViewHeight.constant = 40
        self.appearingViewWidth.constant = 140
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        })
        self.appearingViewHeight.constant = 50
        self.appearingViewWidth.constant = 180
        self.stableViewBottom.constant = 205
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBOutlet var view2: UIView!
    @IBOutlet var view1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearingView.isHidden = true
        
        appearingView.layer.cornerRadius = 8.0
        stableView.layer.cornerRadius = 8.0
        view1.layer.cornerRadius = 8.0
        view2.layer.cornerRadius = 8.0
    }
}
