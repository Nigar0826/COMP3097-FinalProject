//
//  LoginView.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-03-03.
//
import SwiftUI

// Login screen for the Advanced To-Do App
struct LoginView: View {
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

                VStack(spacing: 20) {
                    // App title
                    Text("🚀 ADVANCED TO DO APP")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.top, 20)

                    // Welcome message
                    Text("WELCOME")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    // Email and password input fields
                    CustomTextField(icon: "envelope.fill", placeholder: "Email Address", text: $email)
                    CustomTextField(icon: "lock.fill", placeholder: "Password", text: $password, isSecure: true)

                    // Forgot password link
                    HStack {
                        Spacer()
                        Text("Forgot Password?")
                            .foregroundColor(.yellow)
                            .font(.system(size: 14))
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
            .navigationBarBackButtonHidden(true) // Hide the default Back button
            .navigationDestination(isPresented: $isLoggedIn) {
                ProfileView() // Navigate to ProfileView on successful login
            }
        }
    }

    // Handles login process
    func handleLogin() {
        withAnimation {
            if email.isEmpty || password.isEmpty {
                showError = true
                errorMessage = "Please enter email & password!"
            } else {
                showError = false
                if let savedName = UserDefaults.standard.string(forKey: "fullName") {
                    fullName = savedName
                } else {
                    fullName = "Unknown User"
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isLoggedIn = true
                }
            }
        }
    }
}
