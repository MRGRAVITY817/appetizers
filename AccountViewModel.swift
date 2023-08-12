//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Hoon Wee on 2023/08/13.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published var user = User()
    
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        if user.firstName.isEmpty || user.lastName.isEmpty || user.email.isEmpty {
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
        guard isValidForm else { return }
        
        print("Changes have been saved successfully")
    }
}
