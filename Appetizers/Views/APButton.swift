//
//  APButton.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/28/20.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .background(Color.brandPrimary)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
