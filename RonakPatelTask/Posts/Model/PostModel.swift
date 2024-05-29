//
//  PostModel.swift
//  RonakPatelTask
//
//  Created by Srikanth on 29/05/24.
//

import Foundation
struct PostModel: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
