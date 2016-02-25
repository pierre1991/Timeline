//
//  LoginSignupViewController.swift
//  Timeline
//
//  Created by Pierre on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class LoginSignupViewController: UIViewController {

    
    enum ViewMode {
        case Signup
        case Login
    }
    
    var viewMode = ViewMode.Signup
    
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var bioField: UITextField!
    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    
    
    
    
    @IBAction func actionButtonTapped(sender: AnyObject) {
        if fieldsAreValid {
            switch viewMode {
                case .Login:
                    UserController.authenticateUser(emailField.text!, password: passwordField.text!, completion: { (success, user) -> Void in
                        if success, let _ = user {
                            self.dismissViewControllerAnimated(true, completion: nil)
                        
                        } else {
                            self.presentValidationAlertWithTitle("Check fields", message: "please make sure everything is filled")
                        }
                    })
            case .Signup:
                    UserController.createUser(emailField.text!, username: usernameField.text!, bio: bioField.text, url: urlField.text, completion: { (success, user) -> Void in
                        if success, let _ = user {
                            self.dismissViewControllerAnimated(true, completion: nil)
                        
                        } else {
                            self.presentValidationAlertWithTitle("Unable to Singup", message: "please try again")
                        }
                    })
            }
            
        } else {
            presentValidationAlertWithTitle("Uhm...", message: "please try again")
        }
        
    }
    
    
    func presentValidationAlertWithTitle(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    var fieldsAreValid: Bool {
        get {
            switch viewMode {
            case .Login:
                return !(emailField.text!.isEmpty || passwordField.text!.isEmpty)
            case .Signup:
                return !(usernameField.text!.isEmpty || emailField.text!.isEmpty || passwordField.text!.isEmpty)
            }
        }
    }
    
    
    func updateViewBasedOnMode() {
        switch viewMode {
        case .Signup:
            actionButton.setTitle("Signup", forState: .Normal)
        case .Login:
            usernameField.hidden = true
            bioField.hidden = true
            urlField.hidden = true
            
            actionButton.setTitle("Login", forState: .Normal)
        }
    }
    
    
    
    
    

    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViewBasedOnMode()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
