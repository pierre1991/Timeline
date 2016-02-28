//
//  UserController.swift
//  Timeline
//
//  Created by Taylor Mott on 11/3/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class UserController {
    
<<<<<<< HEAD
    var currentUser: User! = UserController.mockUsers().first
=======
    var currentUser: User! = UserController.mockUsers().first //nil  /*For Testing*/
>>>>>>> parent of 64dab15... Part 5 Solution
    
    static let sharedController = UserController()
    
    static func userForIdentifier(identifier: String, completion: (user: User?) -> Void) {
        
        completion(user: mockUsers().first)
    }
    
    static func fetchAllUsers(completion: (users: [User]) -> Void) {
        
        completion(users: mockUsers())
    }
    
    static func followUser(user: User, completion: (success: Bool) -> Void) {
        
<<<<<<< HEAD
=======
        completion(success: true)
    }
    
    static func unfollowUser(user: User, completion: (success: Bool) -> Void) {
        
>>>>>>> parent of 64dab15... Part 5 Solution
        completion(success: true)
    }
    
    static func userFollowsUser(user: User, followsUser: User, completion: (follows: Bool) -> Void ) {
       
        completion(follows: true)
    }
    
    static func followedByUser(user: User, completion: (followed: [User]?) -> Void) {
        
<<<<<<< HEAD
        completion(followed: mockUsers())
=======
        completion(followed: [mockUsers()[1], mockUsers()[0]])
>>>>>>> parent of 64dab15... Part 5 Solution
    }
    
    static func authenticateUser(email: String, password: String, completion: (success: Bool, user: User?) -> Void) {
        
        completion(success: true, user: mockUsers().first)
    }
    
    static func createUser(email: String, username: String, password: String, bio: String?, url: String?, completion: (success: Bool, user: User?) -> Void) {
        
        
        completion(success: true, user: mockUsers().first)
    }
    
    static func updateUser(user: User, username: String, bio: String?, url: String?, completion: (success: Bool, user: User?) -> Void) {
     
        completion(success: true, user: mockUsers().first)
    }
    
    static func logoutCurrentUser() {
<<<<<<< HEAD
    
=======
       UserController.sharedController.currentUser = nil
>>>>>>> parent of 64dab15... Part 5 Solution
    }
    
    static func mockUsers() -> [User] {
        
        let user1 = User(username: "hansolo", uid: "1234")
        let user2 = User(username: "ob1kenob", uid: "1235")
        let user3 = User(username: "3po", uid: "1236")
        
        return [user1, user2, user3]
    }
}
