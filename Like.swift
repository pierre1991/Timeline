//
//  Like.swift
//  Timeline
//
//  Created by Pierre on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Like: Equatable {
    
    private var kUsername = "usernameKey"
    private var kPost = "postKey"
    
    
    var username: String
    var identifier: String
    var postIdentifier: String?
    
    init(username: String, identifier: String, postIdentifier: String? = nil) {
        self.username = username
        self.identifier = identifier
        self.postIdentifier = postIdentifier
    }
}

func ==(lhs: Like, rhs: Like) -> Bool {
    return (lhs.username == rhs.identifier)
}