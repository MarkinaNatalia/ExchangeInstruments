//
//  CurrencyPair.swift
//  ExchangeInstruments
//
//  Created by Наталья on 22.11.2023.
//

import SwiftUI

enum CurrencyPairType {
    case eurUsd
    case gpbUsd
    
    var pairName: String {
        switch self {
        case .eurUsd:
            return "EUR / USD"
        case .gpbUsd:
            return "GPB / USD"
        }
    }
}

struct CurrencyPair {
    let type: CurrencyPairType
    private(set) var isActive: Bool
    
    mutating func toggleIsActive() {
        self.isActive.toggle()
    }
}
