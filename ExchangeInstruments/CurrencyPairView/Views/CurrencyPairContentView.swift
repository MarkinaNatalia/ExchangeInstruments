//
//  CurrencyPairContentView.swift
//  ExchangeInstruments
//
//  Created by Наталья on 22.11.2023.
//

import SwiftUI

struct CurrencyPairContentView: View {
    @ObservedObject var viewModel: CurrencyPairViewModel
    
    init(viewModel: CurrencyPairViewModel) {
        self.viewModel = viewModel
    }
    
    private var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 36) {
            Text("Currency pair")
                .font(.custom("Inter-Bold", size: 22))
                .foregroundStyle(.white)
            LazyVGrid(columns: columns, spacing: 21) {
                ForEach(0..<viewModel.currencyPairs.count) { index in
                    CurrencyPairItemView(
                        title: viewModel.currencyPairs[index].type.pairName,
                        isActive: viewModel.currencyPairs[index].isActive,
                        action: {
                            
                        }
                    )
                }
            }
        }
        .padding(EdgeInsets(top: 10, leading: 37, bottom: 47, trailing: 37))
        .background(
            Color("TopBackground")
        )
        .ignoresSafeArea(.all)
    }
}
