//
//  Day4ViewController.swift
//  AnimationChallenge
//
//  Created by Nataliia Koldaeva on 9/25/17.
//  Copyright © 2017 Nataliia Koldaeva. All rights reserved.
//

import Foundation
import UIKit

class Day4ViewController: UIViewController {

    @IBOutlet var doneImg: UIImageView!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var plusButtonHeight: NSLayoutConstraint!
    @IBOutlet var plusButtonWidth: NSLayoutConstraint!
    @IBAction func plusButtonAction(_ sender: UIButton) {        
        
        plusButton.setTitle(" ", for: .normal)
        
        // MARK: CAKeyframeAnimation or Multi-Stage Animation
        // keyPath - The key path of the property to be animated
        
        // Rotate
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.toValue = 6
        rotateAnimation.duration = 1
        
        // Change color
        let colorKeyframeAnimation = CAKeyframeAnimation(keyPath: "backgroundColor")
        colorKeyframeAnimation.values = [UIColor.black.cgColor, UIColor.blue.cgColor]
        colorKeyframeAnimation.keyTimes = [0, 1]
        colorKeyframeAnimation.duration = 1
        colorKeyframeAnimation.autoreverses = false
        self.plusButton.backgroundColor = UIColor.blue
        
        // Set animations
        self.plusButton.layer.add(rotateAnimation, forKey: nil)
        self.plusButton.layer.add(colorKeyframeAnimation, forKey: "color")

        // Width
        UIButton.animate(withDuration: 1, animations: {
            self.plusButtonWidth.constant = 60
            self.view.layoutIfNeeded()
        }, completion: { (finished: Bool) -> Void in
            UIButton.animate(withDuration: 1, animations: {
                self.plusButtonWidth.constant = 60
                self.view.layoutIfNeeded()
            }, completion: { (finished: Bool) -> Void in
                UIView.animate(withDuration: 1, animations: {
                    self.doneImg.isHidden = false
                })
            })
        })
    }
    
    override func viewDidLoad() {
    }
}
