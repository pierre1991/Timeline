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
    
    static func postsForUser(user: User, copmletion: (posts:[Post]?) -> Void) {
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
    
    static func orderPosts(post: [Post]) -> [Post] {
        return []
    }
    
    static func mockPosts() -> [Post] {
        
        let sampleId = "-K1l4125TYvKMc7rcp5e"
        
        let like1 = Like(username: "P", postIdentifier: "123")
        let like2 = Like(username: "T", postIdentifier: "456")
        let like3 = Like(username: "Z", postIdentifier: "789")
        
        let comment1 = Comment(username: "obi", text: "nice", postIdentifier: "987")
        let comment2 = Comment(username: "zibi", text: "cool", postIdentifier: "654")
        
 
        
        
        
        return[]
        
        
        
        
        
    }
    
    //    static func mockPosts() -> [Post] {
    //
    //        let sampleImageIdentifier = "-K1l4125TYvKMc7rcp5e"
    //
    //        let like1 = Like(username: "darth", postIdentifier: "1234")
    //        let like2 = Like(username: "look", postIdentifier: "4566")
    //        let like3 = Like(username: "em0r0r", postIdentifier: "43212")
    //
    //        let comment1 = Comment(username: "ob1kenob", text: "use the force", postIdentifier: "1234")
    //        let comment2 = Comment(username: "darth", text: "join the dark side", postIdentifier: "4566")
    //
    //        let post1 = Post(imageEndpoint: sampleImageIdentifier, caption: "Nice shot!", comments: [comment1, comment2], likes: [like1, like2, like3])
    //        let post2 = Post(imageEndpoint: sampleImageIdentifier, caption: "Great lookin' kids!")
    //        let post3 = Post(imageEndpoint: sampleImageIdentifier, caption: "Love the way she looks when she smiles like that.")
    //
    //        return [post1, post2, post3]
    //    }
    
    
    
    
    
    
    
    
}