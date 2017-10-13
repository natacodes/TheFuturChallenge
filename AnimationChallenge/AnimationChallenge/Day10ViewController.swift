//
//  Day10ViewController.swift
//  AnimationChallenge
//
//  Created by Nataliia Koldaeva on 10/12/17.
//  Copyright © 2017 Nataliia Koldaeva. All rights reserved.
//

import Foundation
import UIKit

class Day10ViewController: UIViewController {
   
    @IBOutlet var firstView: UIView!
    @IBOutlet var secondView: UIView!
    @IBOutlet var secondViewTopSpace: NSLayoutConstraint!
    @IBOutlet var myView: UIView!
    @IBOutlet var lastView: UIView!
    @IBOutlet var myViewLeading: NSLayoutConstraint!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var deleteButtonLeading: NSLayoutConstraint!
    @IBOutlet var deleteButtonTrailing: NSLayoutConstraint!
    
    @IBAction func moveViewButton(_ sender: UIButton) {
        myViewLeading.constant = -90
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.myView.transform = CGAffineTransform(rotationAngle: -(3.0 * CGFloat(Double.pi)) / 180.0)
        })
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        myViewLeading.constant = -320
        deleteButtonLeading.isActive = false
        deleteButtonTrailing.isActive = true
        deleteButtonTrailing.constant = -50
        secondViewTopSpace.constant = 30
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.myView.alpha = 0.5
            self.myView.transform = CGAffineTransform(rotationAngle: -(60.0 * CGFloat(Double.pi)) / 180.0)
            self.deleteButton.transform = CGAffineTransform(rotationAngle: (40.0 * CGFloat(Double.pi)) / 180.0)
            self.deleteButton.alpha = 0.5
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.layer.cornerRadius = 8
        firstView.layer.cornerRadius = 8
        secondView.layer.cornerRadius = 8
        lastView.layer.cornerRadius = 8
        
        myViewLeading.constant = 15
    }
}
