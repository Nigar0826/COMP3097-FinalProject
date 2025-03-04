//
//  ProfileView.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-03-03.
//

import SwiftUI

struct ProfileView: View {
    var userEmail: String // ✅ Receives User Email

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                // Profile Header
                Text("👤 User Profile")
                    .foregroundColor(.yellow)
                    .font(.largeTitle)
                    .bold()

                // User Email Display
                Text("📧 Logged in as:")
                    .foregroundColor(.white)
                    .font(.headline)

                Text(userEmail)
                    .foregroundColor(.yellow)
                    .font(.title2)
                    .bold()

                Spacer()

                // Logout Button
                Button(action: {
                    print("User logged out 🔄")
                }) {
                    Text("Log Out")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.headline)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
    }
}

// MARK: - Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userEmail: "example@email.com")
    }
}

