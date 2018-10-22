//
//  Post.swift
//  TestEngineer
//
//  Created by Dima Bondar on 10/22/18.
//  Copyright © 2018 Dima Bondar. All rights reserved.
//

import Foundation

class Post: Decodable {
    var createdAt: String?
    var title: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case createdAt = "created_at"
    }
}
