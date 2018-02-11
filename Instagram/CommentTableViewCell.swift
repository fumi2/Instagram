//
//  CommentTableViewCell.swift
//  Instagram
//
//  Created by Fumitaka Hijino on 2018/02/07.
//  Copyright © 2018年 Fumitaka Hijino. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class CommentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCommentData(_ commentData: Dictionary<String, String>) {
        // コメントしたユーザー名を代入
        self.nameLabel.text = commentData["commentatorName"]
        self.commentLabel.text = commentData["commentContent"]
    }
    
    
}
