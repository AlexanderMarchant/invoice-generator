//
//  AddInvoiceItemView.swift
//  InvoiceGenerator
//
//  Created by Alex Marchant on 23/11/2022.
//

import SwiftUI
import AlertToast

struct AddInvoiceItemView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            
            Text("Add Invoice Item")
                .font(.largeTitle)
            
            VStack(alignment: .leading, spacing: 5) {
                TextField("Quantity", text: self.$viewModel.quantity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !self.viewModel.quantityPrompt.isEmpty {
                    Text(self.viewModel.quantityPrompt)
                        .font(.caption)
                }
                
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 5) {
                TextField("Name", text: self.$viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !self.viewModel.namePrompt.isEmpty {
                    Text(self.viewModel.namePrompt)
                        .font(.caption)
                }
                
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 5) {
                TextField("Price", text: self.$viewModel.price)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !self.viewModel.pricePrompt.isEmpty {
                    Text(self.viewModel.pricePrompt)
                        .font(.caption)
                }
                
            }
            .padding(.horizontal)
            
            TextField("Description", text: self.$viewModel.description)
                .padding(.horizontal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                DispatchQueue.main.async {
                    NSApp.keyWindow?.makeFirstResponder(nil)
                }
                self.viewModel.createItem()
            }) {
                Text("Save")
            }
            .background(Color.buttonBlue)
            
        }
        .padding()
        .toast(isPresenting: self.$viewModel.showSuccessAlert) {
            AlertToast(
                displayMode: .banner(.pop),
                type: .complete(.white),
                title: "Created",
                style: .success
            )
        }
    }
}

#if DEBUG
struct AddInvoiceItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddInvoiceItemView(viewModel: .init())
    }
}
#endif
