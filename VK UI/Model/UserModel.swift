//
//  Friend.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 18.01.2022.
//

import UIKit

struct User {
    var name: String
    var avatar: UIImage
    var photos: [UIImage]
}

struct PostsJSON: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
