//
//  LoginView.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-03-03.
//
import SwiftUI

// Login screen
struct LoginView: View {
    // State Variables
    @State private var email = ""
    @State private var password = ""
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var isLoggedIn = false
    @State private var fullName: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                // Login Form
                VStack(spacing: 20) {
                    // Welcome message
                    Text("WELCOME")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    // Email and password input fields
                    CustomTextField(placeholder: "Email Address", text: $email)
                        .frame(maxWidth: 340)
                       
                    CustomTextField(placeholder: "Password", text: $password, isSecure: true)
                        .frame(maxWidth: 340)
                    
                    // Forgot password link
                    HStack {
                        Spacer()
                        NavigationLink(destination: ForgotPasswordView()) {
                            Text("Forgot Password?")
                                .foregroundColor(.yellow)
                                .font(.system(size: 14))
                        }
                        .padding(.trailing, 10)
                    }

                    // Error message display
                    if showError {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.system(size: 14))
                            .transition(.opacity)
                    }
                    
                    // Login button
                    Button(action: handleLogin) {
                        Text("Log In")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .font(.headline)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    
                    // Divider with alternative login option
                    HStack {
                        Rectangle().frame(height: 1).foregroundColor(.gray)
                        Text("Or continue with")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                        Rectangle().frame(height: 1).foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    
                    // Apple Sign-In button
                    Button(action: { print("Apple Sign-In Clicked") }) {
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
                    
                    // Sign-up navigation link
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
                .padding()
            }
            .navigationBarBackButtonHidden(true)
            .fullScreenCover(isPresented: $isLoggedIn) {
                ProfileView()// Navigate to Profile on login
            }
        }
    }
    
    // Login Logic
    func handleLogin() {
        withAnimation {
            if email.isEmpty || password.isEmpty {
                showError = true
                errorMessage = "Please enter email & password!"
            } else {
                showError = false
                
                // Load user's full name from UserDefaults
                fullName = UserDefaults.standard.string(forKey: "fullName") ?? "Unknown User"
                
                // Save login session email
                UserDefaults.standard.set(email, forKey: "userEmail")
                
                // Navigate to profile screen after a short delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isLoggedIn = true
                }
            }
        }
    }
}
