//
//  Comment.swift
//  Timeline
//
//  Created by Pierre on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Comment: Equatable, FirebaseType {

    private var kUsername = "usernameKey"
    private var kText = "textKey"
    private var kPost = "postKey"
    
    
    var username: String
    var text: String
    var postIdentifier: String
    var identifier: String?
    
    var endpoint: String {
        return "/posts/\(self.identifier)/comments/"
    }
    
    var jsonValue: [String:AnyObject] {
        return [kUsername:username, kText:text, kPost:postIdentifier]
    }
    
    init?(json: [String:AnyObject], identifier: String) {
        guard let   username = json[kUsername] as? String,
                    text = json[kText] as? String,
                    postIdentifier = json[kPost] as? String else {
                        
                        return nil
        }

            self.username = username
            self.text = text
            self.postIdentifier = postIdentifier
            self.identifier = identifier
    }
    
    init(username: String, text: String, postIdentifier: String, identifier: String? = nil) {
        self.username = username
        self.text = text
        self.postIdentifier = postIdentifier
        self.identifier = identifier
    }
}

func ==(lhs: Comment, rhs: Comment) -> Bool {
    return (lhs.username == rhs.identifier)
}
