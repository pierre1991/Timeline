//
//  ProfileViewController.swift
//  Timeline
//
//  Created by Pierre on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import SafariServices

class ProfileViewController: UIViewController {
    
    
    var user: User?
    var userPosts: [Post] = []
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    func updateBasedOnUser() {
        
        guard let user = user else {return}
        
        title = user.username
        
        PostController.postsForUser(user) { (posts) -> Void in
            if let post = posts {
                self.userPosts = post
            
            } else {
                self.userPosts = []
            }
            self.collectionView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}




extension ProfileViewController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPosts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let collectionItem = collectionView.dequeueReusableCellWithReuseIdentifier("imageCell", forIndexPath: indexPath) as! ImageCollectionViewCell
        
        let post = userPosts[indexPath.item]
        
        collectionItem.updateWithImageIdentifier(post.imageEndPoint)
        
        return collectionItem
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        <#code#>
    }
    
    
}




extension ProfileViewController: ProfileHeaderCollectionReusableViewDelegate {
    
    
    func urlButtonTapped() {
        
        if let userProfileURL = NSURL(string: user!.url!) {
            
            let safariVC = SFSafariViewController(URL: userProfileURL)
            
            presentViewController(safariVC, animated: true, completion: nil)
        }
        
    }
    
    
    
    func followUserButtonTapped() {
    
        if user == UserController.sharedController.currentUser {
            
        } else {
            UserController.userFollowsUser(UserController.sharedController.currentUser, followsUser: user!, completion: { (follows) -> Void in
                if follows {
                    UserController.unfollowUser(self.user!, completion: { (success) -> Void in
                        self.updateBasedOnUser()
                    })
                
                } else {
                    UserController.followUser(self.user!, completion: { (success) -> Void in
                        self.updateBasedOnUser()
                    })
                }
            })
        }
    }
    

  

    
    
}



