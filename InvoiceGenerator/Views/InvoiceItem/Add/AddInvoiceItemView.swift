//
//  AddInvoiceItemView.swift
//  InvoiceGenerator
//
//  Created by Alex Marchant on 23/11/2022.
//

import SwiftUI

struct AddInvoiceItemView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 25) {
            
            Text("Add Invoice Item")
                .font(.largeTitle)
            
            TextField("Quantity", text: self.$viewModel.quantity)
                .padding(.horizontal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Name", text: self.$viewModel.name)
                .padding(.horizontal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Description", text: self.$viewModel.description)
                .padding(.horizontal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Price", text: self.$viewModel.price)
                .padding(.horizontal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                self.viewModel.createItem()
            }) {
                Text("Save")
            }
            
        }
        .padding()
    }
}

#if DEBUG
struct AddInvoiceItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddInvoiceItemView(viewModel: .init())
    }
}
#endif
