//
//  Appetizer.swift
//  Appetizers
//
//  Created by Hoon Wee on 2023/08/12.
//

import Foundation


struct Appetizer: Decodable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001, name: "Test Appetizer", description: "This is the description for my appetizer", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    static let appetizers = [ sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, ]
}
