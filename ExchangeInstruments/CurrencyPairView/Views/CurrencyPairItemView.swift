//
//  CurrencyPairItemView.swift
//  ExchangeInstruments
//
//  Created by Наталья on 22.11.2023.
//

import SwiftUI

struct CurrencyPairItemView: View {
    let title: String
    let isActive: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.custom("Inter-SemiBold", size: 14))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(height: 54)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isActive ? .green : Color("SecondButton"))
        )
    }
}
