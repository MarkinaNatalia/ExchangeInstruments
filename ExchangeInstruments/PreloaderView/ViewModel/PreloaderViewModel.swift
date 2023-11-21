//
//  PreloaderViewModel.swift
//  ExchangeInstruments
//
//  Created by Наталья on 21.11.2023.
//

import SwiftUI

class PreloaderViewModel: ObservableObject {
    @Published var progress: Int
    @Published var isPresented: Bool
    
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    init() {
        self.progress = 0
        self.isPresented = false
    }
    
    func updateProgress() {
        withAnimation {
            if self.progress < 100 {
                self.progress += 1
            } else {
                self.registerLocal()
                self.isPresented = true
            }
        }
    }
    
    func registerLocal() {
        let center = UNUserNotificationCenter.current()

        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yes!")
            } else {
                print("Not")
            }
        }
    }
}
