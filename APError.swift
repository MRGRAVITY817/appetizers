//
//  APError.swift
//  Appetizers
//
//  Created by Hoon Wee on 2023/08/12.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
