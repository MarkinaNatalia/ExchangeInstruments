//
//  CurrencyPairViewModel.swift
//  ExchangeInstruments
//
//  Created by Наталья on 22.11.2023.
//

import SwiftUI

class CurrencyPairViewModel: ObservableObject {
    @Published var currencyPairs: [CurrencyPair] = []
    
    init(currencyPairs: [CurrencyPair]) {
        self.currencyPairs = currencyPairs
    }
    
    func toggleIsActive(index: Int) {
        if let activePairIndex = self.currencyPairs.firstIndex(where: { $0.isActive == true }) {
            self.currencyPairs[activePairIndex].toggleIsActive()
        }
        self.currencyPairs[index].toggleIsActive()
    }
}
