//
//  FetchPostsRequestModel.swift
//  TestEngineer
//
//  Created by Dima Bondar on 10/22/18.
//  Copyright © 2018 Dima Bondar. All rights reserved.
//

import Foundation

class FetchPostsRequestModel: BasePagingRequestModel {
    
    var tags = "story"
    
    override func createRequest() -> BaseRequest {
        return FetchPostsRequest(with: self)
    }
    
}
