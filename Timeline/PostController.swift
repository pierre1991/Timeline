//
//  PostController.swift
//  Timeline
//
//  Created by Pierre on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    

    //MARK: Functions
    static func fetchTimelineForUser(user: User, completion:(posts:[Post]?) -> Void) {
        completion(posts: mockPosts())
    }
    
    static func addPost(image: UIImage, caption: String?, completion:(success: Bool, post: Post?) -> Void) {
        
        ImageController.uploadImage(image) { (identifier) -> Void in
            
            if let identifier = identifier {
                var post = Post(imageEndPoint: identifier, caption: caption)
                post.save()
                completion(success: true, post: post)
            } else {
                completion(success: false, post: nil)
            }
        }
        
    }
    
    static func postFromIdentifier(identifier: String, completion:(post: Post?) -> Void) {
        FirebaseController.dataAtEndpoint("posts/\(identifier)") { (data) -> Void in
            if let data = data as? [String:AnyObject] {
                let post = Post(json: data, identifier: identifier)
                
                completion(post: post)
            } else {
                completion(post: nil)
            }
        }
    }
    
    static func postsForUser(user: User, completion:(posts: [Post]?) -> Void) {
        FirebaseController.base.childByAppendingPath("posts").queryOrderedByChild("username").queryEqualToValue(user.username).observeSingleEventOfType(.Value, withBlock: {snapshot in
            
            if let postDictionaries = snapshot.value as? [String:AnyObject] {
                let posts = postDictionaries.flatMap({Post(json: $0.1 as! [String : AnyObject], identifier: $0.0)})
                let orderedPosts = orderPosts(posts)
                
                completion(posts: orderedPosts)
                
            } else {
                completion(posts: nil)
            }
        })
    }
    
    static func deletePost(post: Post) {
        post.delete()
    }
    
    static func addCommentWithTextToPost(comment: String, post: Post, completion:(success: Bool, post: Post?) -> Void) {
        if let postIdentifier = post.identifier {
            var comment = Comment(username: UserController.sharedController.currentUser.username, text: comment, postIdentifier: postIdentifier)
            comment.save()
            
            PostController.postFromIdentifier(comment.postIdentifier, completion: { (post) -> Void in
                completion(success: true, post: post)
            })
        } else {
            var post = post
            post.save()
            var comment = Comment(username: UserController.sharedController.currentUser.username, text: comment, postIdentifier: post.identifier!)
            comment.save()
            
            PostController.postFromIdentifier(comment.postIdentifier, completion: { (post) -> Void in
                completion(success: true, post: post)
            })
        }
    }
 
    static func deleteComment(comment: Comment, completion:(success: Bool, post: Post?) -> Void) {
        comment.delete()
        
        PostController.postFromIdentifier(comment.postIdentifier) { (post) -> Void in
            completion(success: true, post: post)
        }
    }
    
    static func addLikeToPost(post: Post, completion:(success: Bool, post: Post?) -> Void) {
        if let postIdentifier = post.identifier {
            var like = Like(username: UserController.sharedController.currentUser.username, postIdentifier: postIdentifier)
            like.save()
        } else {
            var post = post
            post.save()
            var like = Like(username: UserController.sharedController.currentUser.username, postIdentifier: post.identifier!)
            like.save()
        }
        
        PostController.postFromIdentifier(post.identifier!) { (post) -> Void in
            completion(success: true, post: post)
        }
    }
    
    static func deleteLike(like: Like, completion:(success: Bool, post: Post?) -> Void) {
        like.delete()
        
        PostController.postFromIdentifier(like.postIdentifier) { (post) -> Void in
            completion(success: true, post: post)
        }
    }
    
    static func orderPosts(post: [Post]) -> [Post] {
        return post.sort({$0.0.identifier > $0.1.identifier})
    }
    
    //MARK: Mock Data
    static func mockPosts() -> [Post] {
        let sampleImageID = "K1l4125TYvKMc7rcp5e"
        
        let like1 = Like(username: "Fred", postIdentifier: "123")
        let like2 = Like(username: "Pero", postIdentifier: "456")
        
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