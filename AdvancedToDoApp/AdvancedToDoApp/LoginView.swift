//
//  LoginView.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-03-03.
//
import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // App title
                Text("ADVANCED TO DO APP")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.top, 20)
                
                // Welcome Text
                Text("WELCOME")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                // Email Input
                CustomTextField(icon: "envelope.fill", placeholder: "Email Address", text: $email)
                
                // Password Input
                CustomTextField(icon: "lock.fill", placeholder: "Password", text: $password, isSecure: true)
                
                // Forgot Password Link
                HStack {
                    Spacer()
                    Text("Forgot Password?")
                        .foregroundColor(Color("goldenColor")) 
                        .font(.system(size: 14))
                        .padding(.trailing, 10)
                }
                
                // Login Button
                Button(action: {}) {
                    Text("Log In")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color("goldenColor"))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .font(.headline)
                }
                .padding(.horizontal)
                
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
                }
                .padding(.horizontal)
                
                // Sign Up Navigation
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.white)

                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .foregroundColor(.yellow)
                            .fontWeight(.bold)
                    }
                }
                .padding(.top, 10)
            }
        }
    }
}

// Reusable Text Field with Icon
struct CustomTextField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .padding(.leading, 10)
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding()
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            } else {
                TextField(placeholder, text: $text)
                    .padding()
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

// Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
