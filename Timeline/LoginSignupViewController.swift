//
//  LoginSignupViewController.swift
//  Timeline
//
//  Created by Pierre on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class LoginSignupViewController: UIViewController {
    
    
    enum ViewMode {
        case Login
        case Signup
    }

    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var bioField: UITextField!
    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    
    var viewMode = ViewMode.Signup
    
    func updateViewBasedOnMode() {
        switch viewMode {
        case .Login:
            usernameField.hidden = true
            bioField.hidden = true
            urlField.hidden = true
            actionButton.setTitle("Login", forState: .Normal)

        case .Signup:
            actionButton.setTitle("Signup", forState: .Normal)
        }
        
    }
    
    var fieldsAreValid: Bool {
        get {
            switch viewMode {
            case .Login:
                return !(emailField.text!.isEmpty || passwordField.text!.isEmpty)
            case .Signup:
                return !(bioField.text!.isEmpty || urlField.text!.isEmpty || emailField.text!.isEmpty)
            }
        }
    }
    
    
    @IBAction func actionButtonTapped(sender: AnyObject) {
        if fieldsAreValid {
            switch viewMode {
            case .Login:
                UserController.authenticateUser(emailField.text!, password: passwordField.text!, completion: { (success, user) -> Void in
                    if success, let _ = user {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    
                    } else {
                        self.presentValidationAlertWithTitle("Sorry", message: "Could not login user")
                    }
                })
            case .Signup:
                UserController.createUser(usernameField.text!, email: emailField.text!, password: passwordField.text!, bio: bioField.text, url: urlField.text, competion: { (success, user) -> Void in
                    if success, let _ = user {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    
                    } else {
                        self.presentValidationAlertWithTitle("Sorry", message: "Could not signup user")
                    }
                })
            }
        }
    }
    
    
    
    
    func presentValidationAlertWithTitle(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
    }

    
    
    
    
 
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViewBasedOnMode()
    }

}
