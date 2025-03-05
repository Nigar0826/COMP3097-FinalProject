//
//  ProfileView.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-03-03.
//

import SwiftUI

struct ProfileView: View {
    var userEmail: String
    var userName: String
    @State private var navigateToLogin = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                // User Profile Header
                HStack {
                    Image(systemName: "person.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.yellow)

                    Text("\(userName)'s Profile")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                }

                // User Info
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

                // Logout Button
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
        .navigationBarBackButtonHidden(true)
        .fullScreenCover(isPresented: $navigateToLogin) {
            LoginView()
        }
    }

    // Logout Function: Navigates back to LoginView
    func handleLogout() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            navigateToLogin = true
        }
    }
}

