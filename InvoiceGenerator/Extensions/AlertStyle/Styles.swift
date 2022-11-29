//
//  Styles.swift
//  InvoiceGenerator
//
//  Created by Alex Marchant on 29/11/2022.
//

import Foundation
import AlertToast

extension AlertToast.AlertStyle {
    
    static var success: AlertToast.AlertStyle {
        return .style(backgroundColor: .success, titleColor: .text, subTitleColor: .text, titleFont: nil, subTitleFont: nil)
    }
    
    static var error: AlertToast.AlertStyle {
        return .style(backgroundColor: .error, titleColor: .text, subTitleColor: .text, titleFont: nil, subTitleFont: nil)
    }
    
    static var warning: AlertToast.AlertStyle {
        return .style(backgroundColor: .warning, titleColor: .text, subTitleColor: .text, titleFont: nil, subTitleFont: nil)
    }
    
}
