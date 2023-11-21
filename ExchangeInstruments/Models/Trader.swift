//
//  Trader.swift
//  ExchangeInstruments
//
//  Created by Наталья on 21.11.2023.
//

import SwiftUI

struct Trader {
    let flag: Image
    let name: String
    let deposit: Int
    private(set) var profit: Int
    
    mutating func changeProfit() {
        let randomInt = Int.random(in: -150..<50)
        self.profit += randomInt
    }
}
