//
//  LoginSignupChoiceViewController.swift
//  Timeline
//
//  Created by Pierre on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class LoginSignupChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toSignIn" {
            let segueDestination = segue.destinationViewController as? LoginSignupViewController
            segueDestination?.viewMode = LoginSignupViewController.ViewMode.Signup
            
        } else if segue.identifier == "toLogin" {
            let segueDestination = segue.destinationViewController as? LoginSignupViewController
            segueDestination?.viewMode = LoginSignupViewController.ViewMode.Login
        }
    }
    
    
    
    

}
