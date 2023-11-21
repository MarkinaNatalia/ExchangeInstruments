//
//  TimerButton.swift
//  ExchangeInstruments
//
//  Created by Наталья on 21.11.2023.
//

import SwiftUI

struct TimerButton: View {
    var isActive: Bool
    
    @State private var value: String = "00:01"
    
    var body: some View {
        VStack(alignment: .center, spacing: 7) {
            Text("Timer")
                .font(.custom("Inter", size: 12))
                .foregroundStyle(.gray)
            HStack(alignment: .center, spacing: 7) {
                Image("MinusIcon")
                Spacer()
                TextField("00:01", text: $value)
                    .keyboardType(.numberPad)
                    .font(.custom("Inter-Bold", size: 16))
                    .foregroundColor(.white)
                Spacer()
                Image("PlusIcon")
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
    TimerButton(isActive: true)
}
