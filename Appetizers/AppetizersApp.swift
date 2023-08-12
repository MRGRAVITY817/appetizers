//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Hoon Wee on 2023/08/12.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
