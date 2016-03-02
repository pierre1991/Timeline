//
//  Post.swift
//  Timeline
//
//  Created by Pierre on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Post: Equatable {
    
    private var kUsername = "usernameKey"
    private var kComments = "commentsKey"
    private var kLikes = "likesKey"
    private var kImage = "imageKey"
    private var kCaption = "captionKey"
    
    
    var username: String
    var comments: [Comment]
    var likes: [Like]
    var imageEndPoint: String
    var caption: String?
    var identifier: String?
    
    init(username: String = "", comments:[Comment] = [], likes:[Like] = [], imageEndPoint: String, caption: String? = nil, identifier: String? = nil) {
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

