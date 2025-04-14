//
//  ProfileView.swift
//  AdvancedToDoApp
//


import SwiftUI

// Profile screen displaying user information
struct ProfileView: View {
    @State private var userName: String = ""
    @State private var userEmail: String = ""

    @State private var navigateToLogin = false
    @Environment(\.presentationMode) var presentationMode // Allows back navigation

    var body: some View {
        NavigationStack {  // Wrap with NavigationStack
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
                    VStack(spacing: 20) {
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
                    
                    // Go to Dashboard Button
                    NavigationLink(destination: DashboardView()) {
                        Text("Go to Dashboard")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(.white)
                            .foregroundColor(Color.black)
                            .cornerRadius(10)
                            .bold()
                            .font(.headline)
                            
                            .padding(.horizontal)
                    }

                    // Logout button
                    Button(action: handleLogout) {
                        Text("Log Out")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .bold()
                            .font(.headline)
                            
                            .padding(.horizontal)
                    }

                    Spacer()
                }
                            .padding()
                            .onAppear {
                                userName = UserDefaults.standard.string(forKey: "fullName") ?? "Unknown User"
                                    userEmail = UserDefaults.standard.string(forKey: "userEmail") ?? "No Email"
                                }
                        }
                        .navigationBarBackButtonHidden(true)
                        .navigationDestination(isPresented: $navigateToLogin) {
                            LoginView()
                        }
        }
    }

    // Logout Functionality
    func handleLogout() {
        UserDefaults.standard.removeObject(forKey: "fullName")
        UserDefaults.standard.removeObject(forKey: "userEmail")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            navigateToLogin = true
        }
    }
}
