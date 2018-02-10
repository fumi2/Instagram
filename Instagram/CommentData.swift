//
//  CommentData.swift
//  Instagram
//
//  Created by Fumitaka Hijino on 2018/02/07.
//  Copyright © 2018年 Fumitaka Hijino. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CommentData: NSObject {
    
    //var id: String?
    var commentContent: String?
    var commentatorId: String?
    var commentatorName: String?
    var postId: String?
    
    init(dictionary: Dictionary<String, String?>) {
        
        //let valueDictionary = snapshot.value as! [String: Any]
        
        self.commentContent = dictionary["commentContent"] as? String
        
        self.commentatorId = dictionary["commentatorId"] as? String
        
        self.commentatorName = dictionary["commentatorName"] as? String
        
        self.postId = dictionary["postId"] as? String
    }

}
