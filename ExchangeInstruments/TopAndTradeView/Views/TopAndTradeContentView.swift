//
//  TopAndTradeContentView.swift
//  ExchangeInstruments
//
//  Created by Наталья on 21.11.2023.
//

import SwiftUI

struct TopAndTradeContentView: View {
    @ObservedObject var viewModel = TopAndTradeViewModel()
    
    var body: some View {
        TabView {
            Group {
                tradeView
                    .tabItem {
                        Label("Trade",
                              image: "TradeIcon")
                    }
                
                topTradersView
                    .tabItem {
                        Label("Top",
                              image: "TopIcon")
                    }
            }
            .toolbarBackground(Color("TabBarBackground"), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            .background(
                Color("TopBackground")
            )
        }
        .accentColor(.green)
    }
    
    var topTradersView: some View {
        VStack(alignment: .center, spacing: 29) {
            Text("TOP 10 Traders")
                .font(.custom("Inter", size: 22))
                .foregroundStyle(.white)
            
            List {
                HStack(alignment: .center, spacing: 14.21) {
                    HStack(alignment: .center, spacing: 4.37) {
                        Text("№")
                            .frame(width: 18.59, alignment: .leading)
                            .font(.custom("Inter", size: 12))
                            .foregroundStyle(.gray)
                        Text("Country")
                            .frame(width: 61.24, alignment: .leading)
                            .font(.custom("Inter", size: 12))
                            .foregroundStyle(.gray)
                    }
                    Text("Name")
                        .frame(width: 67.8, alignment: .trailing)
                        .font(.custom("Inter", size: 12))
                        .foregroundStyle(.gray)
                    Text("Deposit")
                        .frame(width: 61.24, alignment: .trailing)
                        .font(.custom("Inter", size: 12))
                        .foregroundStyle(.gray)
                    Text("Profit")
                        .frame(width: 74.36, alignment: .trailing)
                        .font(.custom("Inter", size: 12))
                        .foregroundStyle(.gray)
                }
                .padding(EdgeInsets(top: 11.88, leading: 8.75, bottom: 11.88, trailing: 8.75))
                .listRowBackground(Color("TopRowBackground"))
                
                ForEach(0 ..< viewModel.traders.count) { index in
                    let trader = viewModel.traders[index]
                    HStack(alignment: .center, spacing: 14.21) {
                        HStack(alignment: .center, spacing: 4.37) {
                            Text("\(index + 1)")
                                .frame(width: 28.43, alignment: .leading)
                                .font(.custom("Inter", size: 14))
                                .foregroundStyle(.gray)
                            trader.flag
                        }
                        Text(trader.name)
                            .frame(width: 67.8, alignment: .trailing)
                            .font(.custom("Inter", size: 14))
                            .foregroundStyle(.white)
                        Text("$\(trader.deposit)")
                            .frame(width: 61.24, alignment: .trailing)
                            .font(.custom("Inter", size: 14))
                            .foregroundStyle(.white)
                        Text("$\(trader.profit)")
                            .frame(width: 74.36, alignment: .trailing)
                            .font(.custom("Inter", size: 14))
                            .foregroundStyle(.green)
                    }
                    .padding(EdgeInsets(top: 11.88, leading: 8.75, bottom: 11.88, trailing: 8.75))
                    .listRowBackground(index % 2 == 1 ? Color("TopRowBackground") : Color.clear)
                }
            }
            .listStyle(.plain)
        }
        .onReceive(viewModel.timer) { _ in
            viewModel.changeProfit()
        }
        .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
    }
    
    var tradeView: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                Text("Trade")
                    .font(.custom("Inter-Bold", size: 22))
                    .foregroundStyle(.white)
                    .padding(.bottom, 15)
                
                VStack(alignment: .center, spacing: 7) {
                    Text("Balance")
                        .font(.custom("Inter-Medium", size: 12))
                        .foregroundStyle(.gray)
                    Text("10 000")
                        .font(.custom("Inter-SemiBold", size: 16))
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 54)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("SecondButton"))
                )
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 25, trailing: 30))
                
                TopAndTradeWebView(url: URL(string: "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21")!)
                    .padding(.bottom, 16)
                
                VStack(alignment: .center, spacing: 10) {
                    CurrencyPairButton(activePair: viewModel.activePair,
                                       contentView: CurrencyPairContentView(viewModel: CurrencyPairViewModel(currencyPairs: viewModel.currencyPairs)))
                    
                    HStack(alignment: .center, spacing: 11) {
                        TimerButton(isActive: false)
                        InvestmentButton(isActive: false)
                    }
                    
                    HStack(alignment: .center, spacing: 11) {
                        Button {
                            
                        } label: {
                            Text("Sell")
                                .font(.custom("Inter-Medium", size: 24))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                .padding(EdgeInsets(top: 8, leading: 20, bottom: 0, trailing: 0))
                        }
                        .frame(height: 54)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.red)
                        )
                        Button {
                            
                        } label: {
                            Text("Buy")
                                .font(.custom("Inter-Medium", size: 24))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                .padding(EdgeInsets(top: 8, leading: 20, bottom: 0, trailing: 0))
                        }
                        .frame(height: 54)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.green)
                        )
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 47, trailing: 30))
            }
            .navigationBarTitle("")
            .background(
                Color("TopBackground")
            )
        }
    }
}

#Preview {
    TopAndTradeContentView()
}
