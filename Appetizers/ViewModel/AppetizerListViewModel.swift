//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/26/20.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
   
    @Published  var appetizers: [Appetizer] = []
    @Published  var alertItem: AlertItem?
    @Published  var isLoading = false
    @Published  var isShowingDetails = false
    @Published  var selectedAppetizer: Appetizer?
    
    func getAppetizer() {
        isLoading = true
        NetworkManager.shared.getAppetizer { [self] (result) in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem  = AlertContext.invalidData
                    case .invalidResponse:
                        alertItem  = AlertContext.invaldResponse
                    case .invalidURL:
                        alertItem  = AlertContext.invaldUrl
                    case .unableToComplete:
                        alertItem  = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
