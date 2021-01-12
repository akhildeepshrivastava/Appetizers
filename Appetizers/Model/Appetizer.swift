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

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockDate {
    static let sampleApptizer = Appetizer(id: 0002, name: "Test Name", description: "Test Description", price: 3.56, imageURL: "https://testurl.com", calories: 7, protein: 8, carbs: 0)
    
    static let order1 = Appetizer(id: 0001, name: "Test Name1", description: "Test Description", price: 3.56, imageURL: "https://testurl.com", calories: 7, protein: 8, carbs: 0)
    
    static let order2 = Appetizer(id: 0002, name: "Test Name2", description: "Test Description", price: 3.56, imageURL: "https://testurl.com", calories: 7, protein: 8, carbs: 0)
    
    static let order3 = Appetizer(id: 0003, name: "Test Name3", description: "Test Description", price: 3.56, imageURL: "https://testurl.com", calories: 7, protein: 8, carbs: 0)
    
    static let orders = [order1, order2, order3]
    
    static let apptizers = [sampleApptizer, sampleApptizer, sampleApptizer, sampleApptizer, sampleApptizer]
}
