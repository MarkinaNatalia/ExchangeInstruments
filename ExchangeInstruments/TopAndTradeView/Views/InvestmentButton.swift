//
//  InvestmentButton.swift
//  ExchangeInstruments
//
//  Created by Наталья on 21.11.2023.
//

import SwiftUI

struct InvestmentButton: View {
    var isActive: Bool
    
    @State private var value: String = "1000"
    
    var body: some View {
        VStack(alignment: .center, spacing: 7) {
            Text("Investment")
                .font(.custom("Inter", size: 12))
                .foregroundStyle(.gray)
            HStack(alignment: .center, spacing: 7) {
                Button {
                    if let v = Int(value) {
                        let newValue = v - 1
                        value = "\(newValue)"
                    }
                } label: {
                    Image("MinusIcon")
                }
                Spacer()
                TextField("1000", text: $value)
                    .keyboardType(.numberPad)
                    .font(.custom("Inter-SemiBold", size: 16))
                    .foregroundColor(.white)
                Spacer()
                Button {
                    if let v = Int(value) {
                        let newValue = v + 1
                        value = "\(newValue)"
                    }
                } label: {
                    Image("PlusIcon")
                }
            }
            .padding(.horizontal, 15)
        }
        .frame(maxWidth: .infinity, maxHeight: 54)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color("SecondButton"))
                .stroke(isActive ? .green : .clear, lineWidth: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        )
    }
}

#Preview {
    InvestmentButton(isActive: true)
}
