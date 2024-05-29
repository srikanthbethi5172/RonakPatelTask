//
//  ViewController.swift
//  RonakPatelTask
//
//  Created by Srikanth on 29/05/24.
//

import UIKit

class ViewController: UIViewController, ServiceResponse, UITableViewDelegate, UITableViewDataSource {
    var isDataLoading:Bool=false
    var pageNo:Int=0
    var limit:Int=10
    var offset:Int=0 //pageNo*limit
    var didEndReached:Bool=false
   
    @IBOutlet weak var postsTableView: UITableView!
    let postVM = PostsViewModel()
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        self.title = "Posts"
       configuration()
        
        // Do any additional setup after loading the view.
    }
    func configuration () {
        self.postsTableView.delegate = self
        self.postsTableView.dataSource = self
        postVM.delegate = self
        postVM.fetchPosts(pageNumber: pageNo, limit: limit)
    }

    func reloadData() {
        self.postsTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postVM.postsAray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else{
            return UITableViewCell()
        }
        let post = postVM.postsAray[indexPath.row]
        
        cell.textLabel?.text = "Id : " + String(post.id)
        cell.detailTextLabel?.text = "Title : " + post.title
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postDetailVC = (self.storyboard?.instantiateViewController(withIdentifier: "PostDetailViewController")) as? PostDetailViewController
        postDetailVC?.model = postVM.postsAray[indexPath.row]
        self.navigationController?.pushViewController(postDetailVC!, animated: true)
        
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

            print("scrollViewWillBeginDragging")
        (self.limit <= 100 ) ? (isDataLoading = false) : (isDataLoading = true)

        }

        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            print("scrollViewDidEndDecelerating")
        }
        //Pagination
        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

                print("scrollViewDidEndDragging")
            if ((postsTableView.contentOffset.y + postsTableView.frame.size.height) >= postsTableView.contentSize.height)
                        {
                if !isDataLoading && self.offset <= 101{
                                isDataLoading = true
                                self.pageNo=self.pageNo+1
                                self.limit=self.limit+10
                                self.offset=self.limit * self.pageNo
                                postVM.fetchPosts(pageNumber: self.pageNo, limit: self.limit)
                               

                            }
                        }


                
        }

}

