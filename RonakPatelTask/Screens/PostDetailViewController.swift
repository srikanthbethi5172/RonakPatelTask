//
//  PostDetailViewController.swift
//  RonakPatelTask
//
//  Created by Srikanth on 29/05/24.
//

import UIKit

class PostDetailViewController: UIViewController {

    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var userId: UILabel!
    
     var model : PostModel? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Post Details"
        if let body = model?.body{
            self.bodyLabel.text = String("body : \(body)")
            self.bodyLabel.numberOfLines = 0
        }
     
        if let title = model?.title{
            self.titleLabel.text = String("Title : \(title)")
            self.titleLabel.numberOfLines = 0
        }
        if let id = model?.id{
            self.idLabel.text = String("Id : \(id)")
            self.idLabel.numberOfLines = 0
        }
        if let userID = model?.userID{
            self.userId.text = String("UserId : \(userID)")
            self.userId.numberOfLines = 0
        }
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
