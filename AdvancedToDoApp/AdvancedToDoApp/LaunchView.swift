//
//  LaunchView.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-03-03.
//

import SwiftUI

// The initial launch screen of the PRIORITASK app.
// Displays the app's branding and provides navigation to the login screen.
struct LaunchView: View {
    var body: some View {
        NavigationView {
            VStack {
                // App title
                Text("PRIORITASK")
                    .foregroundColor(Color.yellow)
                    .font(.title)
                    .bold()
                    .padding(.top, 220)
                
                // Subtitle
                Text("ADVANCED TO DO APP")
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()
                    .padding(.top, 20)

                Spacer()

                // App tagline
                Text("MANAGE YOUR TASKS")
                    .foregroundColor(Color.yellow)
                    .font(.title)
                    .bold()
                    .padding(.bottom, 40)

                // Security Tagline
                Text("SAFE & SECURE")
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 40)

                // Navigation to Login Screen
                NavigationLink(destination: LoginView()) {
                    Text("Let's Start")
                        .frame(width: 250, height: 50)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding(.bottom, 200)

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .ignoresSafeArea()
        }
    }
}
