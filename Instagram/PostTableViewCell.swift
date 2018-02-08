//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Fumitaka Hijino on 2018/02/06.
//  Copyright © 2018年 Fumitaka Hijino. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class PostTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    
    var postData:PostData!
    var commentArray:[CommentData] = []
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var handleCommentButton: UIButton!
    
    @IBOutlet weak var commentTableView: UITableView!
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPostData(_ postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
        
        self.postData = postData
        
        commentTableView.delegate = self
        commentTableView.dataSource = self
        
        // テーブルセルのタップを無効にする
        commentTableView.allowsSelection = false
        
        let nib = UINib(nibName: "CommentTableViewCell", bundle: nil)
        commentTableView.register(nib, forCellReuseIdentifier: "CommentCell")
        
        // テーブル行の高さをAutoLayoutで自動調整する
        commentTableView.rowHeight = UITableViewAutomaticDimension
        
        // テーブル行の高さの概算値を設定しておく
        // 高さ概算値 = 「縦横比1:1のUIImageViewの高さ(=画面幅)」+「いいねボタン、キャプションラベル、その他余白の高さの合計概算(=100pt)」
        commentTableView.estimatedRowHeight = UIScreen.main.bounds.width + 45

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // この投稿に付いたコメントに絞り込み
        let commentArrayOfPost = commentArray.filter( { $0.postId == postData.id} )
        return commentArrayOfPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // この投稿に付いたコメントに絞り込み
        let commentArrayOfPost = commentArray.filter( { $0.postId == postData.id} )
        // セルを取得してデータを設定する
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentTableViewCell
        cell.setCommentData(commentArrayOfPost[indexPath.row])
        
        return cell
    }
    
}
