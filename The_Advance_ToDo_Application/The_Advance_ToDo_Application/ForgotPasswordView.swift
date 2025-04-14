//
//  ForgotPasswordView.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-04-12.
//

import SwiftUI

// Forgot Password screen allowing users to request a password reset link.
// Shows a confirmation alert and navigates back to LoginView upon confirmation.
struct ForgotPasswordView: View {
    // Environment & State
    @Environment(\.dismiss) private var dismiss
    @State private var email: String = ""
    @State private var showAlert = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                // Reset Password Form
                VStack(spacing: 30) {
                    // Title
                    Text("Reset Password")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)

                    // Title
                    Text("Enter your email address below to receive a reset link.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal)

                    // Email Field
                    TextField("Email Address", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal)

                    // Send Reset Link Button
                    Button(action: {
                        showAlert = true
                    }) {
                        Text("Send Reset Link")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .font(.headline)
                    }
                    .padding(.horizontal)

                    Spacer()
                }
                .padding()
            }
            // Alert Confirmation & Dismiss
            .alert("Reset Link Sent", isPresented: $showAlert) {
                Button("OK", role: .cancel) {
                    dismiss() // Return to LoginView after confirmation
                }
            } message: {
                Text("A password reset link has been sent to \(email).")
            }
            // Custom Back Button
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .navigationBar) 
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundColor(.yellow)
                }
            }

            }
        }
    }

