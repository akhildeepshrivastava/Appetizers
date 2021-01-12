//
//  ContentView.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/26/20.
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
                    Image(systemName: "bag")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Orders")
                }

        }
        .accentColor(Color("brandPrimary"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
