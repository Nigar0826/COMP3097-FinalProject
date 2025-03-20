//
//  CustomTextField.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-03-17.
//

import SwiftUI

// Custom text field with an icon and optional secure input
struct CustomTextField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false

    var body: some View {
        HStack {
            // Icon displayed on the left
            Image(systemName: icon)
                .foregroundColor(.yellow)
                .padding(.leading, 10)

            // Secure or regular text field based on isSecure flag
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
