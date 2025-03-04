//
//  LaunchView.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-03-03.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        NavigationView {
            VStack {
                // App title
                Text("ADVANCED TO DO")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.top, 40)

                Spacer()

                // App tagline
                Text("MANAGE YOUR TASK")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding(.bottom, 10)

                // Security Assurance
                Text("SAFE & SECURE")
                    .foregroundColor(Color.yellow)
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
                .padding(.bottom, 50)

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black) 
            .ignoresSafeArea()
        }
    }
}

