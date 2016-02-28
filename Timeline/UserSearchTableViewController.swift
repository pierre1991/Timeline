//
//  UserSearchTableViewController.swift
//  Timeline
//
//  Created by Taylor Mott on 11/3/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class UserSearchTableViewController: UITableViewController {

<<<<<<< Updated upstream
    
    
    
    
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
    
    
    
    
    
=======
    override func viewDidLoad() {
        super.viewDidLoad()
>>>>>>> Stashed changes

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
<<<<<<< Updated upstream

    
    
    
    
    
    
=======
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
>>>>>>> Stashed changes

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
