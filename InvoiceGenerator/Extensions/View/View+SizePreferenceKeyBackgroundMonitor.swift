//
//  View+SizePreferenceKeyBackgroundMonitor.swift
//  InvoiceGenerator
//
//  Created by Alex Marchant on 29/11/2022.
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey
{
    typealias Value = CGSize
    
    static var defaultValue: Value = .zero

    static func reduce(value _: inout Value, nextValue: () -> Value)
    {
        _ = nextValue()
    }
}

extension View
{
    func sizePreferenceKeyBackgroundMonitor(action: @escaping (GeometryProxy) -> Void) -> some View
    {
        self.background(
            GeometryReader { proxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: proxy.size)
                    .onPreferenceChange(SizePreferenceKey.self) { _ in
                        action(proxy)
                    }
            }
        )
    }
}
