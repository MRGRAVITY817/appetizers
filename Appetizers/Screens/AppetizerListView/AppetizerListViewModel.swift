//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Hoon Wee on 2023/08/12.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    func getAppetizers() {
        self.isLoading = true
        NetworkManager.shared.getAppetizers { result in
            // Fetching happens in backend thread
            // but assigning state happens in main thread.
            //
            // So we use DispatchQueue to put in main thread.
            DispatchQueue.main.async {
                
                self.isLoading = false
                
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}


