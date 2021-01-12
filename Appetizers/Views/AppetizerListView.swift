//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/26/20.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
//    @State private var isShowingDetails = false
//    @State private var selectedAppetizer: Appetizer?
 
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetails = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .disabled(viewModel.isShowingDetails)
                
            }
            .onAppear {
                viewModel.getAppetizer()
            }
            .blur(radius: viewModel.isShowingDetails ? 20 : 0)
            
            if viewModel.isShowingDetails {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetails: $viewModel.isShowingDetails)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
            
            
        }
       
        .alert(item: $viewModel.alertItem) { (alert) in
            Alert(title: alert.title, message: alert.messge, dismissButton: alert.dismissButon)
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
            AppetizerRemoteImage(urlStirng: appetizer.imageURL)
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
