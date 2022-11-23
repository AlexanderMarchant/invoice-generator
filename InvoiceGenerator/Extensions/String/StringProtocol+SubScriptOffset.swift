//
//  StringProtocol+SubScriptOffset.swift
//  InvoiceGenerator
//
//  Created by Alex Marchant on 23/11/2022.
//

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
