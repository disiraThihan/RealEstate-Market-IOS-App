//
//  ProfileView.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-05.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var errorMessage: String?
    @EnvironmentObject var appViewModel: AppViewModel

    var body: some View {
        NavigationView {
            VStack {
                Text("If you are a real estate agent, please sign-in here to post your ads.")
                    .foregroundStyle(.secondary)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Image(systemName: "house.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                
                Text("Welcome to RealEstate Market")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 20) {
                    TextField("Enter your email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 20)
                    
                    HStack {
                        if showPassword {
                            TextField("Enter your password", text: $password)
                        } else {
                            SecureField("Enter your password", text: $password)
                        }
                        Button(action: {
                            self.showPassword.toggle()
                        }) {
                            Image(systemName: self.showPassword ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal, 20)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.top, 40)
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                }
                
                Button(action: {
                    authenticateUser(email: email, password: password)
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                .padding(.top, 30)
                
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func authenticateUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                self.appViewModel.isAuthenticated = false
            } else {
                self.appViewModel.isAuthenticated = true
                self.errorMessage = nil
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AppViewModel())
    }
}
