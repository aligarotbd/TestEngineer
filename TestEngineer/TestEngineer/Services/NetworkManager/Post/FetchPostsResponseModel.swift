//
//  FetchPostResponseModel.swift
//  TestEngineer
//
//  Created by Dima Bondar on 10/22/18.
//  Copyright © 2018 Dima Bondar. All rights reserved.
//

import Foundation

class FetchPostsResponseModel: BaseResponseModel {
    var posts: [Post]?
    
    enum CodingKeys: String, CodingKey {
        case posts = "hits"
    }

    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try? decoder.container(keyedBy: CodingKeys.self)
        guard let decoderContainer = container else {
            return
        }
        
        posts = try? decoderContainer.decode([Post].self, forKey: .posts)
    }
}

