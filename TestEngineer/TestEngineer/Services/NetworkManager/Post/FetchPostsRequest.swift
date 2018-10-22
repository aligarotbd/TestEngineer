//
//  FetchPostsRequest.swift
//  TestEngineer
//
//  Created by Dima Bondar on 10/22/18.
//  Copyright © 2018 Dima Bondar. All rights reserved.
//

import Foundation

class  FetchPostsRequest: BaseRequest {
    
    static let pathSearchByDate = "search_by_date"
    
    init(with model: FetchPostsRequestModel) {
        super.init()
        
        self.path.append(FetchPostsRequest.pathSearchByDate)
        self.method = .get
        
        self.parameters["tags"] = model.tags
        self.parameters["page"] = model.page.description
    }
}
