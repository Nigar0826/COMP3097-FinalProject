//
//  SignUpView.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-03-03.
//

import SwiftUI

struct SignUpView: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var agreedToTerms = false
    @State private var showError = false
    @State private var errorMessage = ""
    
    // For Navigation
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // App Title
                Text("🚀 ADVANCED TO DO APP")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.top, 10)
                
                // Sign-up header
                Text("Create your account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                // Input fields
                CustomInputField(icon: "person.fill", placeholder: "Full Name", text: $fullName)
                CustomInputField(icon: "envelope.fill", placeholder: "Email Address", text: $email)
                CustomInputField(icon: "lock.fill", placeholder: "Password", text: $password, isSecure: true)
                
                // Terms & Conditions Toggle
                Toggle(isOn: $agreedToTerms) {
                    Text("I agree to the Privacy Policy & Terms")
                        .foregroundColor(.yellow)
                        .font(.system(size: 14))
                }
                .padding(.horizontal)
                .toggleStyle(SwitchToggleStyle(tint: Color.yellow))
                
                // Error Message Display
                if showError {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.system(size: 14))
                        .padding(.top, -10)
                        .transition(.opacity)
                }

                // Sign-up Button
                Button(action: {
                    handleSignUp()
                }) {
                    Text("Sign Up 🎉")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .font(.headline)
                        .padding(.horizontal)
                        .shadow(radius: 5)
                }
                .animation(.easeInOut, value: showError)
                
                // Divider with "Or continue with"
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                    Text("Or continue with")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // Apple Sign-In Button
                Button(action: {
                    print("Apple Sign-In Clicked")
                }) {
                    HStack {
                        Image(systemName: "applelogo")
                        Text("Sign in with Apple")
                    }
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.headline)
                    .padding(.horizontal)
                    .shadow(radius: 5)
                }
                
                // Navigation to Login
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(.white)
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Log In")
                            .foregroundColor(.yellow)
                            .fontWeight(.bold)
                    }
                }
                .padding(.top, 10)
            }
            .padding()
        }
    }
    
    // MARK: - Sign Up Handler (Now Navigates to Login)
    func handleSignUp() {
        withAnimation {
            if fullName.isEmpty || email.isEmpty || password.isEmpty {
                showError = true
                errorMessage = "Please fill all fields!"
            } else if !agreedToTerms {
                showError = true
                errorMessage = "You must accept the terms!"
            } else {
                showError = false
                print("Sign Up Successful for \(fullName)")
                
                // Navigate to Login Screen after sign-up
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

// MARK: - Reusable Input Field Component
struct CustomInputField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color.yellow)
                .padding(.leading, 10)
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            } else {
                TextField(placeholder, text: $text)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.yellow, lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

// MARK: - Preview
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
