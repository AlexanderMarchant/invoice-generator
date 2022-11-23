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
                var filtered = price.filter { $0.isNumber || $0 == "." }
                
                var split = filtered.components(separatedBy: ".")
                
                if split[0] == "." {
                    DispatchQueue.main.async {
                        self.price = ""
                    }
                }
                
                if split.count >= 2
                {
                    var digits = split[1]
                    if digits.count > 2 {
                        digits = "\(digits[0])\(digits[1])"
                    }
                    filtered = "\(split[0]).\(digits)"
                }
                
                if price != filtered {
                    DispatchQueue.main.async {
                        self.price = filtered
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
