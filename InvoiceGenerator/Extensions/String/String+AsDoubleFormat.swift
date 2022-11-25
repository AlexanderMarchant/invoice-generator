//
//  String+AsDoubleFormat.swift
//  InvoiceGenerator
//
//  Created by Alex Marchant on 25/11/2022.
//

import Foundation

extension String {
    public func asDoubleFormat() -> String {
        
        let filteredString = self.filter { $0.isNumber || $0 == "." }
        
        var formattedString: String!
        
        guard !filteredString.isEmpty else { return "" }
        
        let splitFilteredString = filteredString.split(separator: Character("."), omittingEmptySubsequences: true)
        
        guard !splitFilteredString.isEmpty else { return "" }
        
        if splitFilteredString.count >= 2 {
            
            let decimal = self.calculateDecimal(from: String(splitFilteredString[1]))
            
            formattedString = "\(splitFilteredString[0]).\(decimal)"
            
        } else if splitFilteredString[0] == "." {
            return ""
        } else {
            if filteredString.hasPrefix(".") {
                
                let decimal = self.calculateDecimal(from: String(splitFilteredString[0]))
                
                formattedString = "0.\(decimal)"
                
            } else {
                if filteredString.hasSuffix(".") {
                    formattedString = "\(splitFilteredString[0])."
                } else {
                    formattedString = "\(splitFilteredString[0])"
                }
            }
        }
        
        return formattedString
    }
    
    private func calculateDecimal(from string: String) -> String {
        var decimal = string
        
        if decimal.count > 2 {
            decimal = "\(decimal[0])\(decimal[1])"
        }
        
        return decimal
    }
}
