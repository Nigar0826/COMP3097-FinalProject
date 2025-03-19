//
//  ProfileView.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-03-03.
//

import SwiftUI

// Profile screen displaying user information
struct ProfileView: View {
    @State private var userName: String = UserDefaults.standard.string(forKey: "fullName") ?? "Unknown User"
    @State private var userEmail: String = UserDefaults.standard.string(forKey: "userEmail") ?? "No Email"
    @State private var navigateToLogin = false
    @Environment(\.presentationMode) var presentationMode // Allows back navigation

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                // Profile header with icon and user name
                VStack {
                    Image(systemName: "person.crop.circle.badge.checkmark")
                        .font(.system(size: 60))
                        .foregroundColor(.yellow)

                    Text("\(userName)'s Profile")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                }

                // Display user details
                VStack(spacing: 10) {
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundColor(.white)
                        Text("Name: \(userName)")
                            .font(.title3)
                            .foregroundColor(.white)
                    }

                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.yellow)
                        Text("Email: \(userEmail)")
                            .font(.title3)
                            .foregroundColor(.yellow)
                    }
                }
                .padding()

                Spacer()

                // Logout button
                Button(action: handleLogout) {
                    Text("Log Out")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.headline)
                        .padding(.horizontal)
                }

                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true) // Hides the default back button
                .navigationDestination(isPresented: $navigateToLogin) {
                    LoginView() // Navigate to login after logout
                }
            }


    // Logout Functionality
        func handleLogout() {
            // Clear stored user data
            UserDefaults.standard.removeObject(forKey: "fullName")
            UserDefaults.standard.removeObject(forKey: "userEmail")

            // Navigate back to LoginView
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                navigateToLogin = true
            }
        }
    }
