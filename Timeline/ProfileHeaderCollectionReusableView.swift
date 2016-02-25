//
//  ProfileHeaderCollectionReusableView.swift
//  Timeline
//
//  Created by Pierre on 2/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit


protocol ProfileHeaderCollectionReusableViewDelegate {
    
    func urlButtonTapped()
    func followUserButtonTapped()
}



class ProfileHeaderCollectionReusableView: UICollectionReusableView {
    

    var delegate: ProfileHeaderCollectionReusableViewDelegate?
    
    
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var urlButton: UIButton!
    @IBOutlet weak var followButton: UIButton!
    
    
    func updateWithUser(user: User) {
        
        if let bio = user.bio {
            bioLabel.text = bio
        
        } else {
            bioLabel.hidden = true
        }
        
        
        if let homeButton = user.url {
            urlButton.setTitle(homeButton, forState: .Normal)
            
        } else {
            urlButton.hidden = true
        }
        
        
        
    }
    
    
    @IBAction func urlButtonTapped(sender: AnyObject) {
        delegate?.urlButtonTapped()
    }
    
    @IBAction func followUserButtonTapped(sender: AnyObject) {
        delegate?.followUserButtonTapped()
    }
    
        
}

