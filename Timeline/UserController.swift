//
//  UserController.swift
//  Timeline
//
//  Created by Pierre on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class UserController {
    
    static let sharedController = UserController()
    
    var currentUser: User! = nil
    
    
    static func userForIdentifier(identifier: String, completion:(user: User?) -> Void) {
    }
    
    static func fetchAllUsers(completion:(users: [User]) -> Void) {
    }
    
    static func followUser(user: User, completion:(success: Bool) -> Void) {
    }
    
    static func unfollowUser(user: User, completion:(success: Bool) -> Void) {
    }
    
    static func userFollowsUser(user: User, followsUser: User, completion:(success: Bool) -> Void) {
    }
    
    static func followedByUser(user: User, completion:(followed: [User]?) -> Void) {
    }
    
    static func authenticateUser(email: String, password: String, completion:(success: Bool, user: User?) -> Void) {
    }
    
    static func createUser(email: String, username: String, bio: String?, url: String?, completion:(success: Bool, user: User?) -> Void) {
    }
    
    static func updateUser(user: User, username: String, bio: String?, url: String?, completion:(success: Bool, user: User?) -> Void) {
    }
    
    static func logoutUser() {
    }
    
    
    static func mockUsers() -> [User] {
        let user1 = User(username: "p1991", bio: "from la", url: "", identifier: "123")
        let user2 = User(username: "french", bio: "from gh", url: "", identifier: "456")
        let user3 = User(username: "del_p", bio: "form pt", url: "", identifier: "789")
        
        return [user1, user2, user3]
    }
    
    
}