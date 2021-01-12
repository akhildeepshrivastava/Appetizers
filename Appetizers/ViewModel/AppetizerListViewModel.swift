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
    
    func getAppetizer() {
        NetworkManager.shared.getAppetizer { [self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem  = AlertContext.invaldData
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
