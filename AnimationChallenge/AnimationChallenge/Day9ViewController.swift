//
//  Day9ViewController.swift
//  AnimationChallenge
//
//  Created by Nataliia Koldaeva on 10/6/17.
//  Copyright © 2017 Nataliia Koldaeva. All rights reserved.
//

import Foundation
import UIKit

class Day9ViewController: UIViewController{
    
    @IBOutlet var background: UIView!
    @IBOutlet var circle: UIView!
    @IBOutlet var circleLeading: NSLayoutConstraint!
    @IBOutlet var circleTrailing: NSLayoutConstraint!
    @IBOutlet var iconImg: UIImageView!
    
    var status = "done"
    let iconDone = UIImage(named: "day9-done.pdf") as UIImage?
    let iconCancel = UIImage(named: "day9-cancel.pdf") as UIImage?
    
    @IBAction func triggerButton(_ sender: UIButton) {
        if status == "done" {
            self.circleLeading.constant = 85
            self.circleTrailing.constant = 5
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
                self.iconImg.image = self.iconCancel
                self.view.layoutIfNeeded()
            })
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: {
                self.circle.backgroundColor = UIColor(red:0.99, green:0.32, blue:0.52, alpha:1.0)
            })
            status = "cancel"
        } else {
            self.circleLeading.constant = 5
            self.circleTrailing.constant = 85
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
                self.iconImg.image = self.iconDone
                self.view.layoutIfNeeded()
            })
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: {
                self.circle.backgroundColor = UIColor(red:0.25, green:0.76, blue:0.79, alpha:1.0)
            })
            status = "done"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.layer.cornerRadius = 25.0
        circle.layer.cornerRadius = 20.0
        
    }
}
