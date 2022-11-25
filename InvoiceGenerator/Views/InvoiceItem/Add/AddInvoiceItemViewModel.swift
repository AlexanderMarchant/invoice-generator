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
        
        @Published var itemCreated: Bool = false
        
        var quantityPrompt: String {
            if isValidQuantity() {
                return ""
            } else
            {
                return NSLocalizedString("Enter a whole number greater than 0", comment: "Enter a whole number greater than 0")
            }
        }
        
        var namePrompt: String {
            if isValidName() {
                return ""
            } else
            {
                return NSLocalizedString("Enter a name", comment: "Enter a name")
            }
        }
        
        var pricePrompt: String {
            if isValidPrice() {
                return ""
            } else
            {
                return NSLocalizedString("Enter a number greater than or equal to 0", comment: "Enter a number greater than or equal to 0")
            }
        }
        
        init() {
            self.quantity = ""
            self.name = ""
            self.description = ""
            self.price = ""
        }
        
        func createItem() {
            guard isValidQuantity(),
                  isValidName(),
                  isValidPrice(),
                  let quantity = Int(self.quantity),
                  let price = Double(self.price) else {
                return
            }
            
            self.item = InvoiceItem(quantity: quantity, name: self.name, price: price, description: self.description)
        }
        
        private func isValidQuantity() -> Bool {
            guard let quantity = Int(self.quantity),
                  quantity > 0 else {
                return false
            }
            
            return true
        }
        
        private func isValidName() -> Bool {
            return !self.name.isEmpty
        }
        
        private func isValidPrice() -> Bool {
            guard let price = Double(self.price),
                  price >= 0 else {
                return false
            }
            
            return true
        }
        
    }
    
}
