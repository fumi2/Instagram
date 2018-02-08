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
    
    var id: String?
    var commentContent: String?
    var commentatorId: String?
    var commentatorName: String?
    var postId: String?
    
    init(snapshot: DataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: Any]
        
        self.commentContent = valueDictionary["commentContent"] as? String
        
        self.commentatorId = valueDictionary["commentatorId"] as? String
        
        self.commentatorName = valueDictionary["commentatorName"] as? String
        
        self.postId = valueDictionary["postId"] as? String
    }

}
