//
//  HomeViewModel.swift
//  SampleTv
//
//  Created by @karthi on 20/03/23.
//

import Foundation

// MARK: - Class HomeViewModel

class HomeViewModel: BaseViewModel {
    
    // MARK: - Get Coffee API Call
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
    
    public func setSharedCoffeList(_ coffee: CoffeeList) {
        SharedCoffeList.shared.coffeeList = coffee
    }
    
    public func checkCartItems() -> CoffeeList? {
        if let cartItems = SharedCoffeList.shared.coffeeList?.filter({$0.isInCart}),
           cartItems.count > 0 {
            return cartItems
        } else {
            return nil
        }
    }
}


class SharedCoffeList {
    static let shared = SharedCoffeList()
    public var coffeeList: CoffeeList?
}
