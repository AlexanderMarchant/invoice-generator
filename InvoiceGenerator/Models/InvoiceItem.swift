//
//  InvoiceItem.swift
//  InvoiceGenerator
//
//  Created by Alex Marchant on 23/11/2022.
//

import Foundation

class InvoiceItem: ObservableObject {
    
    @Published var quantity: Int
    @Published var name: String
    @Published var description: String?
    @Published var price: Double
    
    var totalPrice: Double {
        return price * Double(quantity)
    }
    
    init(
        quantity: Int,
        name: String,
        price: Double,
        description: String? = nil
    ) {
        self.quantity = quantity
        self.name = name
        self.price = price
        
        if description == "" {
            self.description = nil
        } else {
            self.description = description
        }
    }
}
