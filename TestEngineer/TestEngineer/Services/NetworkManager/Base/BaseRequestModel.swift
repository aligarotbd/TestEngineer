//
//  BaseRequestModel.swift
//  TestEngineer
//
//  Created by Dima Bondar on 10/22/18.
//  Copyright © 2018 Dima Bondar. All rights reserved.
//

import Foundation

class BaseRequestModel {
    
    func createRequest() -> BaseRequest{
        return BaseRequest()
    }
}

class BasePagingRequestModel: BaseRequestModel {
    var page: Int
    
    init(with page: Int) {        
        self.page = page
    }
}
