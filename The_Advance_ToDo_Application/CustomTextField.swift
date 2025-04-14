//
//  CustomTextField.swift
//  AdvancedToDoApp


import SwiftUI

// A reusable custom text field component used across the app.
// Supports both standard and secure (password) input modes, with optional icon.
struct CustomTextField: View {
    // Properties
    var icon: String? = nil
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false

    // Body
    var body: some View {
        HStack {
            // Optional leading icon
            if let icon = icon {
                Image(systemName: icon)
                    .foregroundColor(.gray)
            }

            // SecureField or TextField depending on type
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding(.vertical, 10)
                    .autocapitalization(.none)
            } else {
                TextField(placeholder, text: $text)
                    .padding(.vertical, 10)
                    .autocapitalization(.none)
            }
        }
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(10)
    }
}


