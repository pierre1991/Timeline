//
//  PostDetailTableViewController.swift
//  Timeline
//
//  Created by Pierre on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    
    
    var post: Post?
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    
    @IBAction func likeButtonTapped(sender: AnyObject) {
        PostController.addLikeToPost(post!) { (success, post) -> Void in
            if let post = post {
                self.post = post
                self.updateBasedOnPost()
            }
        }
    }
    
    //MARK: Comment Alert Controller
    @IBAction func addCommentTapped(sender: AnyObject) {
        let addCommentController = UIAlertController(title: "Add Comment", message: "", preferredStyle: .Alert)
        addCommentController.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "Comment"
        }
        addCommentController.addAction(UIAlertAction(title: "Add Comment", style: .Default, handler: { (action) -> Void in
            if let text = addCommentController.textFields?.first?.text {
                PostController.addCommentWithTextToPost(text, post: self.post!, completion: { (success, post) -> Void in
                    if let post = post {
                        self.post = post
                        self.updateBasedOnPost()
                    }
                })
            }
        }))
        addCommentController.addAction(UIAlertAction(title: "Cancel", style: .Destructive, handler: nil))
        presentViewController(addCommentController, animated: true, completion: nil)
    }
    
    
    
    func updateBasedOnPost() {
        guard let post = post else {return}
        
        self.likesLabel.text = "\(post.likes.count) likes"
        self.commentsLabel.text = "\(post.comments.count) comments"
        
        ImageController.imageForIdentifier(post.imageEndPoint) { (image) -> Void in
            self.headerImageView.image = image
        }
        tableView.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateBasedOnPost()
    }

    
    //MARK: Table View Data Source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.post!.comments.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("", forIndexPath: indexPath)
        let comment = post?.comments[indexPath.row]
        
        if let comment = comment {
            cell.textLabel?.text = comment.username
            cell.detailTextLabel?.text = comment.text
        }
        return cell
    }
    
    

    
    
    
    




}
