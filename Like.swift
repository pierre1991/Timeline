//
//  Like.swift
//  Timeline
//
//  Created by Pierre on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Like: Equatable, FirebaseType {
    
    private var kUsername = "usernameKey"
    private var kPost = "postKey"
    
    
    var username: String
    var identifier: String?
    var postIdentifier: String
    
    var endpoint: String {
        return "/posts/\(self.identifier)/likes/"
    }
    
    var jsonValue: [String:AnyObject] {
        return [kUsername:username, kPost:postIdentifier]
    }
    
    
    init?(json:[String:AnyObject], identifier: String) {
        guard let   username = json[kUsername] as? String,
                    postIdentifier = json[kPost] as? String else {
                        
                return nil
        }
            self.username = username
            self.identifier = identifier
            self.postIdentifier = postIdentifier
    }
    
    init(username: String, identifier: String? = nil, postIdentifier: String) {
        self.username = username
        self.identifier = identifier
        self.postIdentifier = postIdentifier
    }
}

func ==(lhs: Like, rhs: Like) -> Bool {
    return (lhs.username == rhs.identifier)
}