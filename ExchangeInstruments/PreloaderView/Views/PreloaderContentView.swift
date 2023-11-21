//
//  PreloaderContentView.swift
//  ExchangeInstruments
//
//  Created by Наталья on 21.11.2023.
//

import SwiftUI

struct PreloaderContentView: View {
    @ObservedObject var viewModel = PreloaderViewModel()
    
    var body: some View {
        ProgressView(value: Float(viewModel.progress), total: 100) {
            
        } currentValueLabel: {
            Text("\(viewModel.progress)%")
        }
        .progressViewStyle(RoundedRectProgressViewStyle())
        .onReceive(viewModel.timer) { _ in
            viewModel.updateProgress()
        }
        .padding(.horizontal, 37)
        .background(
            Image("preloaderBackground")
                .resizable()
                .ignoresSafeArea(.all)
        )
        .fullScreenCover(isPresented: $viewModel.isPresented, content: {
            TopAndTradeContentView(viewModel: TopAndTradeViewModel())
        })
    }
}

#Preview {
    PreloaderContentView()
}
