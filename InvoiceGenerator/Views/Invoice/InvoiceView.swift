//
//  InvoiceView.swift
//  InvoiceGeneratorTests
//
//  Created by Alex Marchant on 29/11/2022.
//

import SwiftUI

struct InvoiceView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            ForEach(self.viewModel.items) {
                InvoiceItemView(item: $0)
            }
        }
    }
}

#if DEBUG
struct InvoiceView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceView(viewModel: .init(items: [
            InvoiceItem(quantity: 5, name: "anterior nasal spine", price: 50000, description: "facial bone"),
            InvoiceItem(quantity: 1, name: "My love for you", price: 10000000000000000000000000000000000000000000000000)
        ]))
    }
}
#endif
