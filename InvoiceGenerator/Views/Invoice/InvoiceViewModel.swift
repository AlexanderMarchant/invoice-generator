//
//  InvoiceViewModel.swift
//  InvoiceGenerator
//
//  Created by Alex Marchant on 29/11/2022.
//

import Foundation

extension InvoiceView {
    
    class ViewModel: ObservableObject {
        
        @Published var items: [InvoiceItem] = []
        
        init(items: [InvoiceItem]) {
            self.items = items
        }
        
    }
    
}
