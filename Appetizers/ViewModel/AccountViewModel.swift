//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/28/20.
//

import Foundation
import SwiftUI

class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastname.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    func saveChanges() {
        guard isValidForm else {
            return
        }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSavedSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func reteriveUser() {
        guard let data = userData else {
            return 
        }
        
        do {
            user = try JSONDecoder().decode(User.self, from: data)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
        
    }
}
