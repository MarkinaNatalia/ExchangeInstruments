//
//  RoundedRectProgressViewStyle.swift
//  ExchangeInstruments
//
//  Created by Наталья on 21.11.2023.
//

import SwiftUI

struct RoundedRectProgressViewStyle: ProgressViewStyle {
    var color: Color = .green
    var height: Double = 24.0
    var labelFontStyle: Font = .custom("Inter-ExtraBold", size: 16)
    
    func makeBody(configuration: Configuration) -> some View {
        let progress = configuration.fractionCompleted ?? 0.0
        
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 30)
                .fill(.gray)
                .frame(maxWidth: .infinity, maxHeight: height)
                .overlay(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(color)
                        .frame(width: geometry.size.width * progress)
                }
                .overlay {
                    if let currentValueLabel = configuration.currentValueLabel {
                        currentValueLabel
                            .font(labelFontStyle)
                            .foregroundStyle(.white)
                    }
                }
                .frame(maxHeight: .infinity)
        }
    }
}
