//
//  Order.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/29/20.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func removeItems(at offset: IndexSet) {
        items.remove(atOffsets: offset)
    }
}
