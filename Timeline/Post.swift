//
//  Post.swift
//  Timeline
//
//  Created by Pierre on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Post: Equatable {
    var username: String
    var likes: [String]
    var comments: [String]
    var caption: String?
    var imageEndPoint: String
    var identifier: String?
    
    init(username: String, likes: [String], comments: [String], caption: String? = nil, imageEndPoint: String, identifier: String? = nil) {
        self.username = username
        self.likes = []
        self.comments = []
        self.caption = caption
        self.imageEndPoint = imageEndPoint
        self.identifier = identifier
    }
}

func ==(lhs: Post, rhs: Post) -> Bool {
    return (lhs.username == rhs.identifier)
}