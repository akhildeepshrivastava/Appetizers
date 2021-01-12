//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/26/20.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockDate.apptizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍟 Appetizers")
        }
       
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}

struct AppetizerListCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90
                )
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing:5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
            
        }
    }
}
