//
//  Alert.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/26/20.
//

import SwiftUI

struct AlertItem: Identifiable {
    
    let id = UUID()
    let title: Text
    let messge: Text
    let dismissButon: Alert.Button
}

struct AlertContext {
    
    //MARK: - NetWork Alert
    static let invalidData       = AlertItem(title: Text("Server Error"), messge: Text("Invalid data from derver"), dismissButon: .default(Text("OK")))
    
    static let invaldResponse   = AlertItem(title: Text("Server Error"), messge: Text("Invalid response From server"), dismissButon: .default(Text("OK")))
    
    static let invaldUrl        = AlertItem(title: Text("Server Error"), messge: Text("Invalid url for Server"), dismissButon: .default(Text("OK")))
    
    static let unableToComplete  = AlertItem(title: Text("Server Error"), messge: Text("Ubale to coplete, pleae check your internet"), dismissButon: .default(Text("OK")))
    
    //MARK: - Account Alert
    static let invalidForm  = AlertItem(title: Text("Invalid Form"), messge: Text("Please fill all fields in Form"), dismissButon: .default(Text("OK")))
    
    static let invalidEmail  = AlertItem(title: Text("Imvalid Email"), messge: Text("Please enter valid email"), dismissButon: .default(Text("OK")))
    
    static let userSavedSuccess  = AlertItem(title: Text("Profile Saved"), messge: Text("User saved successfully"), dismissButon: .default(Text("OK")))
    
    static let invalidUserData   = AlertItem(title: Text("Profile Error"), messge: Text("User couldn't be saved"), dismissButon: .default(Text("OK")))
}
