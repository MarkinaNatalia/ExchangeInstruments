//
//  TopAndTradeViewModel.swift
//  ExchangeInstruments
//
//  Created by Наталья on 21.11.2023.
//

import SwiftUI

class TopAndTradeViewModel: ObservableObject {
    @Published var traders: [Trader] = []
    @Published var activePair: CurrencyPair = .init(type: .eurUsd, isActive: false)
    @Published var currencyPairs: [CurrencyPair] = []
    
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    init() {
        self.setupTraders()
        self.setupPairs()
    }
    
    func setupTraders() {
        let tradersArray = [
            Trader(flag: Image("austria"), name: "Oliver", deposit: 2367, profit: 336755),
            Trader(flag: Image("estonia"), name: "Jack", deposit: 1175, profit: 148389),
            Trader(flag: Image("ethiopia"), name: "Harry", deposit: 1000, profit: 113888),
            Trader(flag: Image("italy"), name: "Jacob", deposit: 999, profit: 36755),
            Trader(flag: Image("nicaragua"), name: "Charley", deposit: 888, profit: 18389),
            Trader(flag: Image("oman"), name: "Thomas", deposit: 777, profit: 12000),
            Trader(flag: Image("slovenia"), name: "George", deposit: 666, profit: 11111),
            Trader(flag: Image("tanzania"), name: "Oscar", deposit: 555, profit: 9988),
            Trader(flag: Image("uganda"), name: "James", deposit: 444, profit: 8877),
            Trader(flag: Image("zimbabwe"), name: "William", deposit: 333, profit: 6652)
        ]
        self.traders = tradersArray.sorted { $0.profit > $1.profit }
    }
    
    func setupPairs() {
        self.currencyPairs = [
            CurrencyPair(type: .eurUsd, isActive: false),
            CurrencyPair(type: .eurUsd, isActive: true),
            CurrencyPair(type: .gpbUsd, isActive: false),
            CurrencyPair(type: .eurUsd, isActive: false),
            CurrencyPair(type: .eurUsd, isActive: false),
            CurrencyPair(type: .gpbUsd, isActive: false),
            CurrencyPair(type: .eurUsd, isActive: false),
            CurrencyPair(type: .eurUsd, isActive: false),
            CurrencyPair(type: .eurUsd, isActive: false),
            CurrencyPair(type: .eurUsd, isActive: false),
            CurrencyPair(type: .gpbUsd, isActive: false),
            CurrencyPair(type: .eurUsd, isActive: false),
            CurrencyPair(type: .eurUsd, isActive: false),
            CurrencyPair(type: .gpbUsd, isActive: false)
        ]
        if let activePair = self.currencyPairs.first(where: { $0.isActive == true }) {
            self.activePair = activePair
        }
    }
    
    func changeProfit() {
        let randomNumber = Int.random(in: 0..<10)
        self.traders[randomNumber].changeProfit()
    }
}
