//
//  PostViewController.swift
//  Instagram
//
//  Created by Fumitaka Hijino on 2018/02/04.
//  Copyright © 2018年 Fumitaka Hijino. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func handlePostButton(_ sender: Any) {
    }
    
    
    
    @IBAction func handleCancelButton(_ sender: Any) {
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
