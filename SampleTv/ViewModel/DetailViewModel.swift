//
//  DetailViewModel.swift
//  SampleTv
//
//  Created by @karthi on 21/03/23.
//

import Foundation

// MARK: - Class DetailViewModel

class DetailViewModel: BaseViewModel {
    
    private var selectedCoffee: CoffeeNetworkResponse?
    
    public func getSelectedCoffee() -> CoffeeNetworkResponse? {
        return selectedCoffee
    }
    
    public func setSelectedCoffeeData(_ coffee: CoffeeNetworkResponse) {
        self.selectedCoffee = coffee
    }
}

