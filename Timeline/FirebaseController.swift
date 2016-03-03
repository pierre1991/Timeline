//
//  FirebaseController.swift
//  Timeline
//
//  Created by Pierre on 3/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
    
    //MARK: Firebase URL
    static let base = Firebase(url: "https://timeline1980.firebaseio.com/")
    
 
    static func dataAtEndpoint(endpoint: String, completion:(data:AnyObject?) -> Void) {
        let newRef = FirebaseController.base.childByAppendingPath(endpoint)
        
        newRef.observeEventType(.Value, withBlock: {snapshot in
            if snapshot.value is NSNull {
                completion(data: nil)
            } else {
                completion(data: snapshot.value)
            }
        })
    }
    
    static func observeDataAtEndpoint(endpoint: String, completion:(data:AnyObject?) -> Void) {
        let newRef = FirebaseController.base.childByAppendingPath(endpoint)
        
        newRef.observeEventType(.Value, withBlock: {snapshot in
            if snapshot.value is NSNull {
                completion(data: nil)
            } else {
                completion(data: snapshot.value)
            }
        })
    }
}



protocol FirebaseType {
    
    var identifier:String? {get set}
    var endpoint:String {get}
    var jsonValue:[String:AnyObject] {get}
    init?(json: [String:AnyObject], identifier: String)
    
    mutating func save()
    func delete()
}

extension FirebaseType {

    mutating func save() {
        var endPoint: Firebase

        if let childID = identifier {
            endPoint = FirebaseController.base.childByAppendingPath(endpoint).childByAppendingPath(childID)
        } else {
            endPoint = FirebaseController.base.childByAppendingPath(endpoint).childByAutoId()
            self.identifier = endPoint.key
        }
    }
    
    func delete() {
        let endPoint = FirebaseController.base.childByAppendingPath(endpoint).childByAppendingPath(self.identifier)
        endPoint.removeValue()
    }
}
