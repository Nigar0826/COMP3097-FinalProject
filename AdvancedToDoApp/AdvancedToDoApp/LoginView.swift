//
//  LoginView.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-03-03.
//
import SwiftUI

struct LoginView: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var isLoggedIn = false
    @State private var loggedInUser: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    // App title
                    Text("🚀 ADVANCED TO DO APP")
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
                            .foregroundColor(.yellow)
                            .font(.system(size: 14))
                            .padding(.trailing, 10)
                    }

                    // Error Message Display
                    if showError {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.system(size: 14))
                            .transition(.opacity)
                    }

                    // Login Button (Passes User Email to ProfileView)
                    Button(action: {
                        handleLogin()
                    }) {
                        Text("Log In")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .font(.headline)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)

                    // Navigation to ProfileView (Activated on Login)
                    NavigationLink(
                        destination: ProfileView(userEmail: loggedInUser, userName: fullName),
                        isActive: $isLoggedIn
                    ) {
                        EmptyView()
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
                .padding()
            }
        }
    }

    // MARK: - Login Handler (Navigates to ProfileView)
    func handleLogin() {
        withAnimation {
            if email.isEmpty || password.isEmpty {
                showError = true
                errorMessage = "Please enter email & password!"
            } else {
                showError = false
                loggedInUser = email // Store Logged-in User

                // Navigate to ProfileView
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isLoggedIn = true
                }
            }
        }
    }
}

// MARK: - Reusable Text Field Component
struct CustomTextField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.yellow)
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
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
