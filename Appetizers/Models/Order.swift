//
//  Order.swift
//  Appetizers
//
//  Created by Hoon Wee on 2023/08/13.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) {
            $0 + $1.price
        }
    }
    
    func add(_ appetizer: Appetizer) {
        self.items.append(appetizer)
    }
    
    func delete(at offsets: IndexSet) {
        self.items.remove(atOffsets: offsets)
    }
}

