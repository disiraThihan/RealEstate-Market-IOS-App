//
//  AppViewModel.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-06.
//

import SwiftUI
import Firebase

class AppViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    
    init() {
        // Listen for authentication state changes
        Auth.auth().addStateDidChangeListener { auth, user in
            self.isAuthenticated = user != nil
        }
    }
}
