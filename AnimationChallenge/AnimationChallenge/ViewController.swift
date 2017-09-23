//
//  ViewController.swift
//  AnimationChallenge
//
//  Created by Nataliia Koldaeva on 9/20/17.
//  Copyright © 2017 Nataliia Koldaeva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var activeTab = "sign_in"
    
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var signInView: UIView!
    @IBOutlet var signUpView: UIView!
    
    @IBOutlet var emailTitleLabel: UILabel!
    @IBOutlet var passwordTitleLabel: UILabel!
    @IBOutlet var confirmPasswordTitleLabel: UILabel!
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var forgotPassword: UIButton!
    
    @IBOutlet var submitButtonToPasswordTextFieldConstraint: NSLayoutConstraint!
    
    // SIGN IN BUTTON ACTON
    @IBAction func signInButton(_ sender: UIButton) {
        
        // Actions without animations
        activeTab = "sign_in"
        self.signInButton.setTitleColor(UIColor.black, for: .normal)
        self.signUpButton.setTitleColor(UIColor(red:0.58, green:0.64, blue:0.71, alpha:1.0), for: .normal)
        self.forgotPassword.isHidden = false
        self.forgotPassword.alpha = 0
        self.emailTitleLabel.text = "Email"
        self.passwordTitleLabel.text = "Password"
        self.submitButtonToPasswordTextFieldConstraint.constant = 140
        self.confirmPasswordTitleLabel.isHidden = false
        self.confirmPasswordTitleLabel.alpha = 1
//        self.submitButton.alpha = 1
        
        // SIGN IN BUTTON ANIMATIONS
        // Hightlight button
        UIView.animate(withDuration: 0.3, animations: {
            self.signInView.alpha = 1.0
            self.signUpView.alpha = 0
        })

        // HIDE CONFIRM PASSWORD LABEL AND TEXT FIELD
        UILabel.animate(withDuration: 0.5, animations: {
            self.confirmPasswordTitleLabel.alpha = 0
            self.confirmPasswordTextField.alpha = 0
        
        }, completion: {
            (finished: Bool) -> Void in
            self.confirmPasswordTitleLabel.isHidden = true
            self.confirmPasswordTextField.isHidden = true
            self.submitButtonToPasswordTextFieldConstraint.constant = 30
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            // SHOW SUBMIT BUTTON
//            UIButton.animate(withDuration: 0.5, animations: {
//                self.submitButton.alpha = 1
            }, completion: {
                (finished: Bool) -> Void in
                UIButton.animate(withDuration: 0.5, animations: {
                    self.forgotPassword.alpha = 1
                }, completion: nil)
            })
        })
    }
    
    // SIGN UP BUTTON ACTON
    @IBAction func signUpButton(_ sender: UIButton) {
        
        // Actions without animations
        activeTab = "sign_up"
        self.signUpButton.setTitleColor(UIColor.black, for: .normal)
        self.signInButton.setTitleColor(UIColor(red:0.58, green:0.64, blue:0.71, alpha:1.0), for: .normal)
        self.forgotPassword.isHidden = true
        self.confirmPasswordTextField.isHidden = false
        self.emailTitleLabel.text = "Enter your email"
        self.passwordTitleLabel.text = "Choose a password"
        self.submitButton.alpha = 1
        self.submitButtonToPasswordTextFieldConstraint.constant = 30
        
        // SIGN UP BUTTON ANIMATIONS
        // Hightlight button
        UIView.animate(withDuration: 0.3, animations: {
            self.signUpView.alpha = 1.0
            self.signInView.alpha = 0
        })
        
        // MOVE SUBMIT BUTTON
        self.submitButtonToPasswordTextFieldConstraint.constant = 140
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
            }, completion: { (finished: Bool) -> Void in
                // SHOW CONFIRM PASSWORD LABEL
                UILabel.animate(withDuration: 0.5, animations: {
                    self.confirmPasswordTitleLabel.isHidden = false
                    self.confirmPasswordTitleLabel.alpha = 1
                }, completion: { (finished: Bool) -> Void in
                    // SHOW CONFIRM PASSWORD TEXT FIELD
                    UITextField.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                        self.confirmPasswordTextField.isHidden = false
                        self.confirmPasswordTextField.alpha = 1
                    }, completion: nil)
                })
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.confirmPasswordTitleLabel.alpha = 0
        self.confirmPasswordTextField.alpha = 0
        self.signUpView.alpha = 0.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activeTab = "sign_in"
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.confirmPasswordTextField.delegate = self
    }
    
    // For hide keyboar on done button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
