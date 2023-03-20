//
//  HomeViewModel.swift
//  SampleTv
//
//  Created by @karthi on 20/03/23.
//

import Foundation

class HomeViewModel: BaseViewModel {
    
    public func getCofeeApiCall(onSuccess: @escaping (CoffeeList) -> Void, onFailure: @escaping (NetworkRequestError) -> Void) {

        /// Network request object created with valid path and method
        let request = CoffeeGetNetworkRequest()
        
        //ProgressHandler.shared.showProgress()
        NetworkManager.execute(request: request, responseType: CoffeeList.self) { (res) in
            switch res {
            case .failure(let err):
                onFailure(err)
            case .success(let data):
                if data.count > 0 {
                    onSuccess(data)
                }
            }
        }
    }
}
