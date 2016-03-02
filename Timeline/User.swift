//
//  User.swift
//  Timeline
//
//  Created by Pierre on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct User: Equatable {
    
    private var kUsername = "usernameKey"
    private var kBio = "bioKey"
    private var kUrl = "urlKey"
    
    
    var username = ""
    var bio: String?
    var url: String?
    var identifier: String?
    
    var endpoint: String {
        return "users"
    }
    
    var jsonValue: [String:AnyObject] {
        var json: [String:AnyObject] = [kUsername:username]
        
        if let bio = bio {
            json.updateValue(bio, forKey: kBio)
        }
        
        if let url = url {
            json.updateValue(url, forKey: kUrl)
        }
        
        return json
    }
    
    
    init?(json: [String:AnyObject], identifier: String) {
        guard let   username = json[kUsername] as? String,
                    bio = json[kBio] as? String,
                    url = json[kUrl] as? String else {
                        
                        return nil
        }
            self.username = username
            self.bio = bio
            self.url = url
    }
    
    
    init(username: String, bio: String? = nil, url: String? = nil, identifier: String?) {
        self.username = username
        self.bio = bio
        self.url = url
        self.identifier = identifier
    }
}

func ==(lhs: User, rhs: User) -> Bool {
    return (lhs.username == rhs.identifier)
}