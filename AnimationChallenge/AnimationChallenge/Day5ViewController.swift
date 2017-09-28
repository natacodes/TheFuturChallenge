//
//  Day5ViewController.swift
//  AnimationChallenge
//
//  Created by Nataliia Koldaeva on 9/27/17.
//  Copyright © 2017 Nataliia Koldaeva. All rights reserved.
//

import Foundation
import UIKit

class Day5ViewController: UIViewController {
    
    @IBOutlet var line1: UIView!
    @IBOutlet var line1Width: NSLayoutConstraint!
    @IBOutlet var line1Height: NSLayoutConstraint!
    @IBOutlet var line1Top: NSLayoutConstraint!
    @IBOutlet var line1Leading: NSLayoutConstraint!
    
    @IBOutlet var line2: UIView!
    @IBOutlet var line2Width: NSLayoutConstraint!
    @IBOutlet var line2Height: NSLayoutConstraint!
    @IBOutlet var line2Top: NSLayoutConstraint!
    @IBOutlet var line2Leading: NSLayoutConstraint!
    
    let doneImg = UIImage(named: "day5_background_view1.pdf") as UIImage?
    
    @IBAction func startAnimationButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.line1.transform = CGAffineTransform(rotationAngle: (40.0 * CGFloat(Double.pi)) / 180.0)
            self.line2.transform = CGAffineTransform(rotationAngle: (-(140.0 * CGFloat(Double.pi)) / 180.0))
            self.line1.backgroundColor = UIColor.green
            self.line2.backgroundColor = UIColor.green
        })
        self.line1Height.constant = 35
        self.line2Width.constant = 17
        self.line1Leading.constant = 36
        self.line2Leading.constant = 15
        self.line1Top.constant = 14
        self.line2Top.constant = 37
        
        UIButton.animate(withDuration: 1, animations: {
            self.view.layoutIfNeeded()
        })
    }
}
