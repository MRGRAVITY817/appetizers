//
//  User.swift
//  Appetizers
//
//  Created by Hoon Wee on 2023/08/13.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
