//
//  InvoiceItemView.swift
//  InvoiceGenerator
//
//  Created by Alex Marchant on 29/11/2022.
//

import SwiftUI

struct InvoiceItemView: View {
    
    let item: InvoiceItem
    
    @State private var itemNameWidth: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
                HStack(spacing: 15) {
                    Text(item.name)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .sizePreferenceKeyBackgroundMonitor { proxy in
                            self.itemNameWidth = CGFloat(proxy.frame(in: .local).width)
                        }
                    
                    Text("\(item.quantity)")
                        .frame(maxWidth: .infinity)
                    
                    Text("\(item.price)")
                        .frame(maxWidth: .infinity)
                }
            
            if let description = item.description {
                Text(description)
                    .frame(maxWidth: self.itemNameWidth)
                    .font(.body)
            }
        }
        .padding()
    }
}

#if DEBUG
struct InvoiceItemView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceItemView(item: InvoiceItem(quantity: 10, name: "Test", price: 19.98))
        InvoiceItemView(item: InvoiceItem(quantity: 10, name: "Test", price: 19.98, description: "A long description to ensure that it only takes up the required space"))
    }
}
#endif
