//
//  CommentViewController.swift
//  Instagram
//
//  Created by Fumitaka Hijino on 2018/02/07.
//  Copyright © 2018年 Fumitaka Hijino. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD


class CommentViewController: UIViewController {

    //var postArray: [PostData] = []
    //var indexPath: IndexPath!
    var postData: PostData!
    //var commentArray: [CommentData]!
    
    @IBOutlet weak var commentTextField: UITextField!
    
    // 「コメントを投稿」ボタンを押したときの動作
    @IBAction func commentPostButton(_ sender: Any) {
        print("DEBUG_PRINT: 「コメント投稿」ボタンがタップされました。")
        
        // commentTextFieldからコメントの内容を取得する
        let commentContent = commentTextField.text
        
        // コメントするユーザー名を取得
        let commentatorName = Auth.auth().currentUser?.displayName
        // コメントするユーザーのidを取得
        let commentatorId = Auth.auth().currentUser?.uid
        
        // コメントについてのFirebaseの保存先を設定
        //let commentRef = Database.database().reference().child(Const.CommentPath)
        
        // コメントについてのFirebaseに保存するデータ（辞書）を作成
        let commentData = ["commentContent": commentContent, "commentatorId": commentatorId, "commentatorName": commentatorName, "postId": self.postData.id]
        
        
        // コメントを付与する投稿についてのFirebaseの保存先を設定
        let postRef = Database.database().reference().child(Const.PostPath).child(self.postData.id!)
        
        var commentArray = self.postData.comments
        //var comments = [CommentData]()
        //for c in commentArray {
        //    if let commentDictionary = c as? [String: String?] {
        //        comments.append(CommentData(dictionary: commentDictionary))
        //    }
        //}
        commentArray.append(commentData)
        
        // データベースの投稿データに最新のcommentsを保存
        postRef.updateChildValues(["comments":commentArray])
        print("DEBUG_PRINT: コメントが対象投稿に紐付けられました。")
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "コメントしました")
        
        // 全てのモーダルを閉じる
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    // 「キャンセル」ボタンを押したときの動作
    @IBAction func commentCancelButton(_ sender: Any) {
        // 画面を閉じる
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
