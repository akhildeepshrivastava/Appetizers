//
//  Appetizer.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/26/20.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
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

struct MockDate {
    static let sampleApptizer = Appetizer(id: 0002, name: "Test Name", description: "Test Description", price: 3.56, imageURL: "https://testurl.com", calories: 7, protein: 8, carbs: 0)
    
    static let apptizers = [sampleApptizer, sampleApptizer, sampleApptizer, sampleApptizer, sampleApptizer]
}
