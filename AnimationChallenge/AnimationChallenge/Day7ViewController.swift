//
//  Day7ViewController.swift
//  AnimationChallenge
//
//  Created by Nataliia Koldaeva on 9/29/17.
//  Copyright © 2017 Nataliia Koldaeva. All rights reserved.
//

import Foundation
import UIKit

class Day7ViewController: UIViewController {
    
    @IBOutlet var lineView: UIView!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button1Width: NSLayoutConstraint!
    
    @IBOutlet var button2: UIButton!
    @IBOutlet var button2Wifth: NSLayoutConstraint!
    
    @IBOutlet var button3: UIButton!
    @IBOutlet var button3Width: NSLayoutConstraint!
    
    @IBOutlet var lineViewLeadingButton1: NSLayoutConstraint!
    @IBOutlet var lineViewTrailingButton1: NSLayoutConstraint!
    
    @IBOutlet var lineViewLeadingButton2: NSLayoutConstraint!
    @IBOutlet var lineViewTrailingButton2: NSLayoutConstraint!
    
    @IBOutlet var lineViewLeadingButton3: NSLayoutConstraint!
    @IBOutlet var lineViewTrailingButton3: NSLayoutConstraint!
    
    var activeButton = "first"
    
    @IBAction func button1Action(_ sender: UIButton) {
        if activeButton == "second" {
            self.lineViewLeadingButton2.isActive = false
            self.lineViewLeadingButton1.isActive = true
            UIButton.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: {(finished: Bool) -> Void in
                self.lineViewTrailingButton2.isActive = false
                self.lineViewTrailingButton1.isActive = true
                UIButton.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion: {(finished: Bool) -> Void in
                })
            })
        }
        if activeButton == "third" {
            self.lineViewLeadingButton3.isActive = false
            self.lineViewLeadingButton1.isActive = true
            UIButton.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: {(finished: Bool) -> Void in
                self.lineViewTrailingButton3.isActive = false
                self.lineViewTrailingButton1.isActive = true
                UIButton.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion: {(finished: Bool) -> Void in
                })
            })
        }
        activeButton = "first"
    }
    
    @IBAction func button2Action(_ sender: UIButton) {
        if activeButton == "first" {
            self.lineViewTrailingButton1.isActive = false
            self.lineViewTrailingButton2.isActive = true
            UIButton.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: {(finished: Bool) -> Void in
                self.lineViewLeadingButton1.isActive = false
                self.lineViewLeadingButton2.isActive = true
                UIButton.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion: {(finished: Bool) -> Void in
                })
            })
        }
        if activeButton == "third" {
            self.lineViewLeadingButton3.isActive = false
            self.lineViewLeadingButton2.isActive = true
            UIButton.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: {(finished: Bool) -> Void in
                self.lineViewTrailingButton3.isActive = false
                self.lineViewTrailingButton2.isActive = true
                UIButton.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion: {(finished: Bool) -> Void in
                })
            })
        }
        activeButton = "second"
    }
    
    @IBAction func button3Action(_ sender: UIButton) {
        if activeButton == "first" {
            self.lineViewTrailingButton1.isActive = false
            self.lineViewTrailingButton3.isActive = true
            UIButton.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: {(finished: Bool) -> Void in
                self.lineViewLeadingButton1.isActive = false
                self.lineViewLeadingButton3.isActive = true
                UIButton.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion: {(finished: Bool) -> Void in
                })
            })
        }
        if activeButton == "second" {
            self.lineViewTrailingButton2.isActive = false
            self.lineViewTrailingButton3.isActive = true
            UIButton.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: {(finished: Bool) -> Void in
                self.lineViewLeadingButton2.isActive = false
                self.lineViewLeadingButton3.isActive = true
                UIButton.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion: {(finished: Bool) -> Void in
                })
            })
        }
        activeButton = "third"
    }
}
