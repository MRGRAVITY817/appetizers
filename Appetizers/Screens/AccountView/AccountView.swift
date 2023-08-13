//
//  AccountView.swift
//  Appetizers
//
//  Created by Hoon Wee on 2023/08/12.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .disableAutocorrection(true)
                        .submitLabel(.next)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField  = .lastName }
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .disableAutocorrection(true)
                        .submitLabel(.next)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField  = .email }
                    
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .submitLabel(.continue)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField  = nil }
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthDate, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequest Refills", isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("😛 Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") {
                        focusedTextField = nil
                    }
                }
            }
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
