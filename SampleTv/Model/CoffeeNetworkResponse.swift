//
//  CoffeeNetworkResponse.swift
//  SampleTv
//
//  Created by @karthi on 20/03/23.
//

import Foundation

// MARK: - CoffeeNetworkResponse
class CoffeeNetworkResponse: Codable {
    let title, description: String
    let ingredients: [String]
    let image: String
    let id: Int
    let isFavourite = false
    let isInCart = false
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case ingredients
        case image
        case id
    }
}

typealias CoffeeList = [CoffeeNetworkResponse]
