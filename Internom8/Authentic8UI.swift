//
//  Authentic8UI.swift
//  Internom8
//
//  Created by chase Crummedyo on 7/28/24.
//

import SwiftUI

struct Authentic8UI: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isCreatingAccount = true
    @State private var isPasswordVisible = false
    @State private var isConfirmPasswordVisible = false

    var body: some View {
        ZStack {
            // Background color
            Color(hex: "14181B").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // App title
                Text("JACKPOT")
                    .font(.custom("RobotoMono-Bold", size: 24))
                    .foregroundColor(.white)
                Text("AUTOMATIONS")
                    .font(.custom("RobotoMono-Bold", size: 24))
                    .foregroundColor(.white)
                
                // Create Account / Log In toggle
                HStack(spacing: 20) {
                    Button("Create Account") {
                        isCreatingAccount = true
                    }
                    .foregroundColor(.white)
                    .underline(isCreatingAccount, color: Color(hex: "00a724"))
                    
                    Button("Log In") {
                        isCreatingAccount = false
                    }
                    .foregroundColor(.white)
                    .underline(!isCreatingAccount, color: Color(hex: "00a724"))
                }
                .padding(.top, 20)
                
                if isCreatingAccount {
                    createAccountForm
                } else {
                    loginForm
                }
                
                // Get Started button
                Button(action: {
                    // Handle authentication
                }) {
                    Text("Get Started")
                        .foregroundColor(.black)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "00a724"))
                        .cornerRadius(8)
                }
                .padding(.top, 20)
                
                // Or sign up with
                Text("Or sign up with")
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                
                // Social login buttons
                socialLoginButton(text: "Continue with Google", imageName: "google")
                socialLoginButton(text: "Continue with Apple", imageName: "apple")
            }
            .padding(.horizontal)
        }
    }
    
    var createAccountForm: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Create Account")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text("Let's get started by filling out the form below.")
                .font(.subheadline)
                .foregroundColor(.gray)
            customTextField(placeholder: "Email", text: $email, imageName: "xmark.circle.fill")
            customSecureField(placeholder: "Password", text: $password, isVisible: $isPasswordVisible)
            customSecureField(placeholder: "Confirm Password", text: $confirmPassword, isVisible: $isConfirmPasswordVisible)
        }
    }
    
    var loginForm: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Log In")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            customTextField(placeholder: "Email", text: $email, imageName: "xmark.circle.fill")
            customSecureField(placeholder: "Password", text: $password, isVisible: $isPasswordVisible)
        }
    }
    
    func customTextField(placeholder: String, text: Binding<String>, imageName: String) -> some View {
        HStack {
            TextField(placeholder, text: text)
                .foregroundColor(.white)
            Button(action: {
                text.wrappedValue = ""
            }) {
                Image(systemName: imageName)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(hex: "1d2428"))
        .cornerRadius(8)
    }
    
    func customSecureField(placeholder: String, text: Binding<String>, isVisible: Binding<Bool>) -> some View {
        HStack {
            if isVisible.wrappedValue {
                TextField(placeholder, text: text)
                    .foregroundColor(.white)
            } else {
                SecureField(placeholder, text: text)
                    .foregroundColor(.white)
            }
            Button(action: {
                isVisible.wrappedValue.toggle()
            }) {
                Image(systemName: isVisible.wrappedValue ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(hex: "1d2428"))
        .cornerRadius(8)
    }
    
    func socialLoginButton(text: String, imageName: String) -> some View {
        Button(action: {
            // Handle social login
        }) {
            HStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                Text(text)
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.black)
            .cornerRadius(8)
        }
    }
}

// Color extension for hex color support
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// Preview provider for Xcode canvas
struct Authentic8UI_Previews: PreviewProvider {
    static var previews: some View {
        Authentic8UI()
    }
}
