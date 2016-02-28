//
//  UserController.swift
//  Timeline
//
//  Created by Pierre on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class UserController {
    
    var currentUser: User! = nil
    
    static let sharedController = UserController()
    
    
    static func userForIdentifier(identifier: String, completion:(user: User?) -> Void) {
    }
    
    static func fetchAllUsers(completion:(user: [User]?) -> Void) {
    }
    
    static func followUser(user: User, completion:(success: Bool) -> Void) {
    }
    
    static func userFollowsUser(user: User, followsUser: User, completion:(follows: Bool) -> Void) {
    }
    
    static func followedByUser(user: User, completion:(followed: [User]?) -> Void) {
    }
    
    static func authenticateUser(email: String, password: String, completion:(success: Bool, user: User?) -> Void) {
    }
    
    static func createUser(username: String, email: String, password: String, bio: String?, url: String?, competion:(success: Bool, usre: User?) -> Void) {
    }
    
    static func logoutUser() {
    }
    
    static func mockUsers() -> [User] {
        
        let user1 = User(username: "Pete", bio: nil, url: nil, identifier: "1234")
        let user2 = User(username: "Fred", bio: nil, url: nil, identifier: "567")
        let user3 = User(username: "Jon", identifier: "89")
        
        return [user1, user2, user3]
    }
    
    
}