//
//  HTTPEndPoint.swift
//  RonakPatelTask
//
//  Created by Srikanth on 29/05/24.
//

import Foundation

enum HTTPMethods : String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    var path : String {get}
    var baseUrl : String {get}
    var url : URL? {get}
    var method: HTTPMethods {get}
}

enum EndPointItems{
    case posts
}
extension EndPointItems : EndPointType{
    var path: String{
        switch self{
        case .posts :
            return "posts"
        }
    }
    
    var baseUrl: String{
        return "https://jsonplaceholder.typicode.com/"
    }
    
    var url: URL?{
     return URL(string: "\(baseUrl)\(path)")
    }
    
    var method: HTTPMethods{
        switch self {
        case .posts :
            return .get
        }
    }
    
    
}
