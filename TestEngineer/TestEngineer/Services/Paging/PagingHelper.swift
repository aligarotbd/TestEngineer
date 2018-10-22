//
//  PagingHelper.swift
//  TestEngineer
//
//  Created by Dima Bondar on 10/22/18.
//  Copyright © 2018 Dima Bondar. All rights reserved.
//

import Foundation

protocol PagingDelegate {
    func next()
}

class PagingHelper<R: BasePagingRequestModel, S: BaseResponseModel> {
    private(set) var currentPage = 0
    private var requestModel: R
    private var isLoading = false
    
    var loadingCallback: ((_ responseModel: S?) -> Void)?
    var errorCallback: (( _ error: Error) -> Void)?
    
    init(with requestModel: R) {
        self.requestModel = requestModel
    }
    
    func fetchNext() {
        if isLoading  {
            return
        }
        
        isLoading = true
        currentPage += 1
        
        requestModel.page = currentPage
        
        NetworkManager.instance.dataTask(requestModel: requestModel, successBlock: { [weak self] (response: S?) in
            self?.loadingCallback?(response)
            self?.isLoading = false
        }) { [weak self] (error) in
            self?.errorCallback?(error)
            self?.currentPage -= 1
            self?.isLoading = false
        }
    }
}
