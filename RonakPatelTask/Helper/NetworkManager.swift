//
//  NetworkManager.swift
//  RonakPatelTask
//
//  Created by Srikanth on 29/05/24.
//

import Foundation

enum customError : Error{
    case badURL
    case invalidResponse
}
class NetworkManager {
    static let shared = NetworkManager()
    private init(){
        
    }
    
    func getPostsAPICall<T: Codable> (url : URL?) async throws -> T {
        guard let url = url else{
            throw customError.badURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
       guard (response as? HTTPURLResponse)?.statusCode == 200 else{
           throw customError.invalidResponse
        }
        
        return try! JSONDecoder().decode(T.self, from: data)
    }
}
