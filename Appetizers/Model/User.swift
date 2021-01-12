//
//  User.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/28/20.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastname        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
