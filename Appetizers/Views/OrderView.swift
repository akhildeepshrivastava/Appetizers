//
//  OrderView.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/26/20.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationView {
            Text("Account")
                .navigationTitle("🧾 Orders")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
