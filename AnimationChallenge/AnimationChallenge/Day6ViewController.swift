//
//  Day6ViewController.swift
//  AnimationChallenge
//
//  Created by Nataliia Koldaeva on 9/28/17.
//  Copyright © 2017 Nataliia Koldaeva. All rights reserved.
//

import Foundation
import UIKit

class Day6ViewController: UIViewController {
    
    var status = "close"
    
    @IBOutlet var topButton: UIButton!
    @IBOutlet var middleButton: UIButton!
    @IBOutlet var bottomButton: UIButton!
    @IBOutlet var bottomBWidth: NSLayoutConstraint!
    @IBOutlet var triggerButton: UIButton!
    
    @IBOutlet var bottomBConstrain: NSLayoutConstraint!
    @IBOutlet var topBConstrain: NSLayoutConstraint!
    @IBOutlet var middleBConstrain: NSLayoutConstraint!
    
    @IBAction func triggerButtonAction(_ sender: UIButton) {
        if status == "open"{
            UIButton.animate(withDuration: 0.5, animations: {
                self.triggerButton.transform = CGAffineTransform(rotationAngle: -(CGFloat.pi / 2))
            })
            self.topBConstrain.constant = 280
            UIButton.animate(withDuration: 0.2, animations: {
                self.view.layoutIfNeeded()
            }, completion: {(finished: Bool) -> Void in
                self.topButton.isHidden = true
                self.middleBConstrain.constant = 190
                UIButton.animate(withDuration: 0.2, animations: {
                    self.view.layoutIfNeeded()
                }, completion: {(finished: Bool) -> Void in
                    self.middleButton.isHidden = true
                    self.bottomBConstrain.constant = 100
                    self.bottomBWidth.constant = 60
                    UIButton.animate(withDuration: 0.2, animations: {
                        self.bottomButton.alpha = 0
                        self.view.layoutIfNeeded()
                    })
                })
            })
            self.status = "close"
        } else {
            UIButton.animate(withDuration: 0.5, animations: {
                self.triggerButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
            })
            self.bottomButton.isHidden = false
            self.bottomBConstrain.constant = 190
            self.bottomBWidth.constant = 215
            UIButton.animate(withDuration: 0.2, animations: {
                self.view.layoutIfNeeded()
                self.bottomButton.alpha = 1
            }, completion: {(finished: Bool) -> Void in
                self.middleButton.isHidden = false
                self.middleBConstrain.constant = 280
                UIButton.animate(withDuration: 0.2, animations: {
                    self.view.layoutIfNeeded()
                }, completion: {(finished: Bool) -> Void in
                    self.topButton.isHidden = false
                    self.topBConstrain.constant = 370
                    UIButton.animate(withDuration: 0.2, animations: {
                        self.view.layoutIfNeeded()
                    })
                })
            })
            self.status = "open"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomButton.alpha = 0
        bottomBWidth.constant = 60
    }
}
