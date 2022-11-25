//
//  AddInvoiceItemViewModel.swift
//  InvoiceGenerator
//
//  Created by Alex Marchant on 23/11/2022.
//

import Foundation

extension AddInvoiceItemView {
    
    class ViewModel: ObservableObject {
        
        @Published private(set) var item: InvoiceItem? = nil
        
        @Published var quantity: String = "" {
            didSet {
                let filtered = quantity.filter { $0.isNumber }
                
                if quantity != filtered {
                    DispatchQueue.main.async {
                        self.quantity = filtered
                    }
                }
            }
        }
        
        @Published var name: String
        @Published var description: String
        @Published var price: String {
            didSet {
                
                let formattedPrice = price.asDoubleFormat()
                
                if price != formattedPrice {
                    DispatchQueue.main.async {
                        self.price = formattedPrice
                    }
                }
            }
        }
        
        init() {
            self.quantity = ""
            self.name = ""
            self.description = ""
            self.price = ""
        }
        
        func createItem() {
            
        }
        
    }
    
}
