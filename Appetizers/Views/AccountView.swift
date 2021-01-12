//
//  AccountView.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/26/20.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("LastName", text: $viewModel.user.lastname)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday",
                               selection: $viewModel.user.birthdate,
                               in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo,
                               displayedComponents: .date)
                    
                    
                    Button(action: {
                        viewModel.saveChanges()
                    })  {
                        Text("Save Change")
                    }
                }
                
                Section(header: Text("Personal Info")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                
            }
                .navigationTitle("😂 Account")
        }
        .onAppear {
            viewModel.reteriveUser()
        }
        .alert(item: $viewModel.alertItem) { (alert) in
            Alert(title: alert.title, message: alert.messge, dismissButton: alert.dismissButon)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
