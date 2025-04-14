//
//  SignUpView.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-03-03.
//

import SwiftUI

// Sign-up screen for new users
struct SignUpView: View {
    // State Variables
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var isSignedUp = false

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            // Sign-up form
            VStack(spacing: 20) {
                // Heading
                Text("Create your account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                // Input fields for sign-up
                CustomTextField(placeholder: "Full Name", text: $fullName)
                    .frame(maxWidth: 340)
                            
                CustomTextField(placeholder: "Email Address", text: $email)
                    .frame(maxWidth: 340)
                            
                CustomTextField(placeholder: "Password", text: $password, isSecure: true)
                    .frame(maxWidth: 340)
                
                // Display error message if sign-up fails
                if showError {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.system(size: 14))
                        .transition(.opacity)
                }
                
                // Sign-up button
                Button(action: handleSignUp) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .font(.headline)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
            }
            .padding()
        }
        // Navigation Handling
        .navigationBarBackButtonHidden(true) 
        .fullScreenCover(isPresented: $isSignedUp) {
            LoginView()  // Navigate to LoginView after successful sign-up
        }
    }

    // Sign-Up Logic
    func handleSignUp() {
        if fullName.isEmpty || email.isEmpty || password.isEmpty {
            showError = true
            errorMessage = "All fields are required!"
        } else {
            showError = false
            
            // Save user details in UserDefaults
            UserDefaults.standard.set(fullName, forKey: "fullName")
            UserDefaults.standard.set(email, forKey: "userEmail")

            // Navigate to login screen after a short delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isSignedUp = true
            }
        }
    }
}
