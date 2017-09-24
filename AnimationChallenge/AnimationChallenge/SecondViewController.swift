//
//  SecondViewController.swift
//  AnimationChallenge
//
//  Created by Nataliia Koldaeva on 9/23/17.
//  Copyright © 2017 Nataliia Koldaeva. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    // MARK: CABasicAnimation
    let theAnimation = CABasicAnimation(keyPath: "position")
    let timing = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
   
    let screenSize = UIScreen.main.bounds

    @IBOutlet var bouncingButton: UIButton!
    @IBAction func bouncingButtonAction(_ sender: UIButton) {
        theAnimation.toValue = [bouncingButton.layer.position.x, bouncingButton.layer.position.y - 20]
        theAnimation.duration = 0.2
        theAnimation.autoreverses = true
        theAnimation.repeatCount = 1
        theAnimation.timingFunction = timing
        bouncingButton.layer.add(theAnimation, forKey: "position")
    }
    
    @IBOutlet var successButton: UIButton!
    @IBOutlet var successButtonCenterX: NSLayoutConstraint!
    @IBOutlet var successButtonLeading: NSLayoutConstraint!
    @IBOutlet var successButtonWidth: NSLayoutConstraint!
    @IBAction func successButtonAction(_ sender: UIButton) {
        self.successButtonCenterX.isActive = false
        self.successButtonLeading.isActive = true
        self.successButtonLeading.constant = self.screenSize.width
        UIButton.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        }, completion: { (finished: Bool) -> Void in
            self.successButtonLeading.constant = -self.screenSize.width
            self.successButton.alpha = 0.0
            UIButton.animate(withDuration: 0, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (finished: Bool) -> Void in
                self.successButtonLeading.isActive = false
                self.successButtonCenterX.isActive = true
                self.successButton.alpha = 1
                self.successButton.setTitle("", for: .normal)
                self.successButton.setBackgroundImage(UIImage(named: "square.pdf"), for: .normal)
                self.successButtonWidth.isActive = true
                self.successButtonWidth.constant = 60
                UIButton.animate(withDuration: 0.4, animations: {
                    self.view.layoutIfNeeded()
                }, completion: { (finished: Bool) -> Void in
                    self.successButton.setBackgroundImage(UIImage(named: "square_done.pdf"), for: .normal)
                    UIButton.animate(withDuration: 0.2, animations: {
                        self.view.layoutIfNeeded()
                    }, completion: nil)
                })
            })
        })
    }
    
    @IBOutlet var failureButton: UIButton!
    @IBOutlet var failureButtonCenterX: NSLayoutConstraint!
    @IBOutlet var failureButtonLeading: NSLayoutConstraint!
    @IBOutlet var failureButtonWidth: NSLayoutConstraint!
    @IBAction func failureButtonAction(_ sender: UIButton) {
        self.failureButtonCenterX.isActive = false
        self.failureButtonLeading.isActive = true
        self.failureButtonLeading.constant = self.screenSize.width
        UIButton.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        }, completion: { (finished: Bool) -> Void in
            self.failureButtonLeading.constant = -self.screenSize.width
            self.failureButton.alpha = 0.0
            UIButton.animate(withDuration: 0, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (finished: Bool) -> Void in
                self.failureButtonLeading.constant = 200
                self.failureButton.alpha = 1
                self.failureButton.setTitle("", for: .normal)
                self.failureButton.setBackgroundImage(UIImage(named: "square.pdf"), for: .normal)
                self.failureButtonWidth.isActive = true
                self.failureButtonWidth.constant = 60
                UIButton.animate(withDuration: 0.4, animations: {
                    self.view.layoutIfNeeded()
                }, completion: { (finished: Bool) -> Void in
                    self.failureButtonLeading.constant = 150
                    self.failureButton.setBackgroundImage(UIImage(named: "square_fail.pdf"), for: .normal)
                    UIButton.animate(withDuration: 0.2, animations: {
                        self.view.layoutIfNeeded()
                    }, completion: { (finished: Bool) -> Void in
                        self.failureButtonLeading.isActive = false
                        self.failureButtonCenterX.isActive = true
                        UIButton.animate(withDuration: 0.3, animations: {
                            self.view.layoutIfNeeded()
                        }, completion: nil)
                    })
                })
            })
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.successButtonLeading.isActive = false
        successButtonWidth.isActive = false
        self.failureButtonLeading.isActive = false
        failureButtonWidth.isActive = false
    }
}
