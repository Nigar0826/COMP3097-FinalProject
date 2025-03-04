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
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) 
            
            VStack(spacing: 20) {
                // App Title
                Text("ADVANCED TO DO APP")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.top, 10)
                
                // Sign-up header
                Text("Create your account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                // Input fields
                CustomTextField(icon: "person.fill", placeholder: "Full Name", text: $fullName)
                CustomTextField(icon: "envelope.fill", placeholder: "Email Address", text: $email)
                CustomTextField(icon: "lock.fill", placeholder: "Password", text: $password, isSecure: true)
                
                // Terms & Conditions Toggle
                Toggle(isOn: $agreedToTerms) {
                    Text("I have read & agreed to Privacy Policy, Terms & Conditions")
                        .foregroundColor(Color.yellow)
                        .font(.system(size: 14))
                }
                .padding(.horizontal)
                .toggleStyle(SwitchToggleStyle(tint: Color.yellow))
                
                // Sign-up Button
                Button(action: {}) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .font(.headline)
                        .padding(.horizontal)
                }
                
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
                Button(action: {}) {
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
                }
                
                // Navigation to Login
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(.white)
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Log In")
                            .foregroundColor(Color.yellow)
                            .fontWeight(.bold)
                    }
                }
                .padding(.top, 10)
            }
            .padding()
        }
    }
}

// Reusable Input Field Component
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

// Preview
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
