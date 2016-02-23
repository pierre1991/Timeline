//
//  PostController.swift
//  Timeline
//
//  Created by Pierre on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit



class PostController {
    
    
    static func fetchTimelineForUser(user: User, completion:[Post]) -> Void {
    }
    
    static func addPost(image: UIImage, caption: String?, completion:(success: Bool, post: Post?) -> Void) {
    }
    
    static func postFromIdentifier(identifier: String, completion:(Post?)-> Void) {
    }
    
    static func postForUser(user: User, copmletion:[Post]?) -> Void {
    }
    
    static func deletePost(post: Post) {
    }
    
    static func addCommentWithTextToPost(comment: String, post: Post, completion:(success: Bool, post: Post?) -> Void) {
    }
    
    static func deleteComment(comment: String, completion:(success: Bool, post: Post?) -> Void) {
    }
    
    static func addLikeToPost(post: Post, completion:(success: Bool, post: Post?) -> Void) {
    }
    
    static func deleteLikes(like: Like, completions:(success: Bool, post: Post?) -> Void) {
    }
    
    static func orderPosts(post: [Post]) -> [] {
        return
    }
    
    static func mockPosts() -> [Post] {
        
    }
    
    
    
    
    
    
    
    
    
    
}