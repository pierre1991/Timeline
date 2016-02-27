//
//  UserSearchResultsTableViewController.swift
//  Timeline
//
//  Created by Pierre on 2/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class UserSearchResultsTableViewController: UITableViewController {
    
    
    
    
    var userResultsDataSource: [User] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    


    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userResultsDataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("", forIndexPath: indexPath)
        let user = userResultsDataSource[indexPath.row]
        cell.textLabel?.text = user.username

        return cell
    }


    
    //MARK: Table View Delegate
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        self.presentingViewController?.performSegueWithIdentifier("toProfileView", sender: cell)
    }


}
