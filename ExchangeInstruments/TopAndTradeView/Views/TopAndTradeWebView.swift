//
//  TopAndTradeWebView.swift
//  ExchangeInstruments
//
//  Created by Наталья on 21.11.2023.
//

import SwiftUI
import WebKit

struct TopAndTradeWebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView  {
        let wkwebView = WKWebView()
        let request = URLRequest(url: url)
        wkwebView.load(request)
        return wkwebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}
