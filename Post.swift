//
//  Post.swift
//  Timeline
//
//  Created by Pierre on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Post: Equatable, FirebaseType {
    
    private var kUsername = "usernameKey"
    private var kComments = "commentsKey"
    private var kLikes = "likesKey"
    private var kImageEndpoint = "imageKey"
    private var kCaption = "captionKey"
    
    
    var username: String
    var comments: [Comment]
    var likes: [Like]
    var imageEndPoint: String
    var caption: String?
    var identifier: String?
    
    var endpoin: String {
        return "posts"
    }
    
    var jsonValue: [String:AnyObject] {
        var json: [String: AnyObject] = [kUsername : username, kImageEndpoint : imageEndPoint, kComments : comments.map({$0.jsonValue}), kLikes : likes.map({$0.jsonValue})]
        
        if let caption = caption {
            json.updateValue(caption, forKey: kCaption)
        }
        
        return json
    }
    
    init?(json: [String:AnyObject], identifier: String) {
        guard let   imageEndPoint = json[kImageEndpoint] as? String,
                    username = json[kUsername] as? String else {
                        
                        return nil
        }
        
        self.username = username
        self.caption = json[kCaption] as? String
        self.identifier = identifier
        self.imageEndPoint = imageEndPoint
        
        if let commentDictionary = json[kComments] as? [String:AnyObject] {
            self.comments = commentDictionary.flatMap({Comment(json: $0.1 as! [String:AnyObject], identifier: $0.0)})
        } else {
            self.comments = []
        }
        
        if let likeDictionary = json[kLikes] as? [String:AnyObject] {
            self.likes = likeDictionary.flatMap({Like(json: $0.1 as! [String:AnyObject], identifier: $0.0)})
        } else {
            self.likes = []
        }
    }
    
    init(username: String = "", comments:[Comment] = [], likes:[Like] = [], imageEndPoint: String, caption: String?, identifier: String? = nil) {
        self.username = username
        self.comments = comments
        self.likes = likes
        self.imageEndPoint = imageEndPoint
        self.caption = caption
        self.identifier = identifier
    }
}

func ==(lhs: Post, rhs: Post) -> Bool {
    return (lhs.username == rhs.identifier)
}

