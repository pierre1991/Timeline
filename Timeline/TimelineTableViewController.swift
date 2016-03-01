//
//  TimelineTableViewController.swift
//  Timeline
//
//  Created by Pierre on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController {
    
    
    
    var posts: [Post] = []
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let currentUser = UserController.sharedController.currentUser {
            if posts.count > 0 {
                loadTimelineForUser(currentUser)
            }
        } else {
            tabBarController?.performSegueWithIdentifier("noCurrentUserSegue", sender: nil)
        }
    }
    
    func loadTimelineForUser(user: User) {
        PostController.fetchTimelineForUser(user) { (posts) -> Void in
            if let posts = posts {
                self.posts = posts
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                    self.refreshControl?.endRefreshing()
                })
            }
        }
    }
    
    
    @IBAction func userRefreshedTable(sender: AnyObject) {
        
        loadTimelineForUser(UserController.sharedController.currentUser)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! PostTableViewCell

        let post = posts[indexPath.row]
        cell.updateWithPost(post)
        return cell
    }
    
    
    
    //MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toTimelinePostDetail" {
            if let  cell = sender as? UITableViewCell,
                    indexPath = tableView.indexPathForCell(cell) {

                        let post = posts[indexPath.row]
                        let toTimelineVC = segue.destinationViewController as? PostDetailTableViewController
                        toTimelineVC?.post = post
            }
        }
    }
    
    
    


}
