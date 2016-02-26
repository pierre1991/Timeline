//
//  UserSearchTableViewController.swift
//  Timeline
//
//  Created by Pierre on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class UserSearchTableViewController: UITableViewController {

    
    
    
    
    //MARK: Properties
    var userDataSource: [User] = []
    
    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!
    
    
    //MARK: Actions
    @IBAction func selectedIndexChanged(sender: AnyObject) {
    
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViewBasedOnMode()
    }

    
    
    //MARK: View Mode
    enum ViewMode: Int {
        case Friends = 0
        case All = 1
        
        func users(completion:(user: [User]?) -> Void) {
            switch self {
            case Friends:
                UserController.followedByUser(UserController.sharedController.currentUser, completion: { (followed) -> Void in
                    completion(user: followed)
                })
                
            case All:
                UserController.fetchAllUsers({ (users) -> Void in
                    completion(user: users)
                })
            }
        }
    }
    
    var mode: ViewMode {
        get {
            return ViewMode(rawValue: modeSegmentedControl.selectedSegmentIndex)!
        }
    }
    
    func updateViewBasedOnMode() {
        mode.users { (user) -> Void in
            if let user = user {
                self.userDataSource = user
                
            } else {
                self.userDataSource = []
            }
            
            self.tableView.reloadData()
        }
    }
    
    
    
    
    




    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("usernameCel", forIndexPath: indexPath)
        
        let user = userDataSource[indexPath.row]
        
        cell.textLabel?.text = user.username
        
        return cell
    }

    
    
    
    
    
    


}
