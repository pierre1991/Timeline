//
//  UserSearchTableViewController.swift
//  Timeline
//
//  Created by Pierre on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class UserSearchTableViewController: UITableViewController, UISearchResultsUpdating {

    
    
    enum ViewMode: Int {
        case All = 0
        case Friends = 1
    
        func users(completion:(users: [User]?) -> Void) {
            switch self {
            case .All:
                UserController.fetchAllUsers({ (user) -> Void in
                    completion(users: user)
                })
                
            case .Friends:
                UserController.followedByUser(UserController.sharedController.currentUser, completion: { (followed) -> Void in
                    completion(users: followed)
                })
            }
        }
    }
    
    
    
    var viewMode: ViewMode {
        get {
            return ViewMode(rawValue: modeSegmentedControl.selectedSegmentIndex)!
        }
    }
    
    var user: User?
    var userDatasource: [User] = []
    
    func updateViewBasedOnMode() {
        viewMode.users { (users) -> Void in
            if let users = users {
                self.userDatasource = users
            } else {
                self.userDatasource = []
            }
            self.tableView.reloadData()
        }
    }
    
    
    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!
    
    @IBAction func selectIndexChanged(sender: AnyObject) {
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(user)
        updateViewBasedOnMode()
        setupSearchController()
    }


    
    var userResultsDatasource: [User] = []
    
    var searchController: UISearchController!
    


    
    
    ////////////////////////////////////////////
    //MARK: Search Controller
    func setupSearchController() {
        
        let resultController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("UserSearchResultsTableViewController")
        
        searchController = UISearchController(searchResultsController: resultController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "search here.."
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchTerm = searchController.searchBar.text!.lowercaseString
        
        let resultsVC = searchController.searchResultsController as! UserSearchResultsTableViewController
        resultsVC.userResultsDatasource = userResultsDatasource.filter({$0.username.lowercaseString.containsString(searchTerm)})
    }
    ///////////////////////////////////////////
    

    
    
    
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDatasource.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        let user = userDatasource[indexPath.row]
        cell.textLabel?.text = user.username
        return cell
    }
    

    
    



    ///////////////////////////////////////////
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toProfileView" {
            guard let cell = sender as? UITableViewCell else {return}
            
            if let indexPath = tableView.indexPathForCell(cell) {
                let user = userDatasource[indexPath.row]
                let destinationVC = segue.destinationViewController as? ProfileViewController
                destinationVC?.user = user
            
            } else if let indexPath = (searchController.searchResultsController as? UserSearchResultsTableViewController)?.tableView.indexPathForCell(cell) {
                
                let user = (searchController.searchResultsController as! UserSearchResultsTableViewController).userResultsDatasource[indexPath.row]
                
                let destinationViewController = segue.destinationViewController as? ProfileViewController
                destinationViewController?.user = user
            }
        }
    }
    //////////////////////////////////////////

}
