//
//  LaunchView.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-03-03.
//

import SwiftUI

// Launch Screen
struct LaunchView: View {
    var body: some View {
        NavigationView {
            VStack {
                // App Title
                Text("Advanced To-Do App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                // Navigation button to go to LoginView
                NavigationLink(destination: LoginView()) {
                    Text("Get Started")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

// Preview
struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
