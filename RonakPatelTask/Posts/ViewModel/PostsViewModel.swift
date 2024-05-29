//
//  PostsViewModel.swift
//  RonakPatelTask
//
//  Created by Srikanth on 29/05/24.
//

import Foundation

protocol ServiceResponse : AnyObject {
    func reloadData()
}
class PostsViewModel  {
     weak var delegate : ServiceResponse?
    var postsAray : [PostModel] = []{
        didSet {
            self.delegate?.reloadData()
        }
    }
    
    @MainActor func fetchPosts(pageNumber : Int, limit : Int) {
        Task{
            do{
                
                let url = EndPointItems.posts.baseUrl + EndPointItems.posts.path + "?_page=\(pageNumber)&_limit=\(limit)"
                let posts: [PostModel] = try await NetworkManager.shared.getPostsAPICall(url: URL(string: url))
                print("Result : \(posts)")
                self.postsAray = posts
            }
            catch (let error){
                print(error.localizedDescription)
            }
        }
    }
    
}
