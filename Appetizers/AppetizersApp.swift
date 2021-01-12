//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/26/20.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
