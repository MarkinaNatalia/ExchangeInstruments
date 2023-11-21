//
//  CurrencyPairButton.swift
//  ExchangeInstruments
//
//  Created by Наталья on 22.11.2023.
//

import SwiftUI

struct CurrencyPairButton: View {
    let activePair: CurrencyPair
    let contentView: CurrencyPairContentView
    
    var body: some View {
        NavigationLink {
            contentView
        } label: {
            ZStack(alignment: .trailing) {
                Text(activePair.type.pairName)
                    .font(.custom("Inter-SemiBold", size: 16))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 54)
                Image("ArrowLeft")
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color("SecondButton"))
        )
    }
}
