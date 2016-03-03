//
//  LoginSingupChoiceViewController.swift
//  Timeline
//
//  Created by Pierre on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class LoginSingupChoiceViewController: UIViewController {

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toLoginView" {
            let destinationVC = segue.destinationViewController as? LoginSignupViewController
            destinationVC?.viewMode = LoginSignupViewController.ViewMode.Login
            
        } else if segue.identifier == "toSignupView" {
            let destinationVC = segue.destinationViewController as? LoginSignupViewController
            destinationVC?.viewMode = LoginSignupViewController.ViewMode.Signup
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    

}
