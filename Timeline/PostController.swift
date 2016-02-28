//
//  PostController.swift
//  Timeline
//
//  Created by Pierre on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class PostController {
    
    
    static func fetchTimelineForUser(user: User, completion:(posts:[Post]?) -> Void) {
    }
    
    static func addPost(image: String, caption: String?, completion:(success: Bool, post: Post?) -> Void) {
    }
    
    static func postFromIdentifier(identifier: String, completion:(post: Post?) -> Void) {
    }
    
    static func postsForUser(user: User, completion:(posts: [Post]?) -> Void) {
    }
    
    static func deletePost(post: Post) {
    }
    
    static func addCommentWithTextToPost(comment: String, post: Post, completion:(success: Bool, post: Post?) -> Void) {
    }
 
    static func deleteComment(comment: Comment, completion:(success: Bool, post: Post?) -> Void) {
    }
    
    static func addLikeToPost(post: Post, completion:(success: Bool, post: Post?) -> Void) {
    }
    
    static func deleteLike(like: Like, completion:(success: Bool, post: Post?) -> Void) {
    }
    
    static func orderPosts(post: [Post]) -> [Post] {
        return []
    }
    
    
    static func mockPosts() -> [Post] {
        
        let sampleImageID = "K1l4125TYvKMc7rcp5e"
        
        let like1 = Like(username: "Fred", identifier: "123")
        let like2 = Like(username: "Pero", identifier: "456")
        
        let comment1 = Comment(username: "Toro", text: "Hey", postIdentifier: "12")
        let comment2 = Comment(username: "Gary", text: "Hola", postIdentifier: "34")
        
        let post1 = Post(comments: [comment1, comment2], likes: [like1, like2],imageEndPoint: sampleImageID, caption: "Nice shot!")
        let post2 = Post(imageEndPoint: sampleImageID, caption: "Great lookin' kids!")
        
        return [post1, post2]
    }
    
    
}



/*
fetchTimelineForUser
addPost
postFromIdentifier
postsForUser
deletePost
addCommentWithTextToPost
deleteComment
addLikeToPost
deleteLike
orderPosts
*/