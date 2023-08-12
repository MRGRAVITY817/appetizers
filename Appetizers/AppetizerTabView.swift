//
//  ContentView.swift
//  Appetizers
//
//  Created by Hoon Wee on 2023/08/12.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
             OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                    
                }
            
        }
        .accentColor(.brandPrimary)
    }
}

struct AppetizerTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
