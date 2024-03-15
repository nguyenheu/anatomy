//
//  RegisterView.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 15/03/2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var registerViewModel = RegisterViewModel()
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("Register\nBelow!")
                    .font(.fontCabinSketch(.bold, fontSize: 50))
                    .foregroundColor(.black)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.bottom, 30)
                
                CustomTextField(text: $registerViewModel.email, title: "Email", width: .screenWidth - 20, showPassword: $registerViewModel.showPassword)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                
                CustomTextField(text: $registerViewModel.password, title: "Password", width: .screenWidth - 20, showPassword: $registerViewModel.showPassword)
                
                CustomTextField(text: $registerViewModel.username, title: "username", width: .screenWidth - 20, showPassword: $registerViewModel.showPassword)
                
                HStack {
                    Text("Register")
                        .font(.fontCabinSketch(.bold, fontSize: 24))
                        .foregroundColor(.black)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                        
                    Button {
                        registerViewModel.register()
                    } label: {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.coral)
                            .shadow(color: Color.coral, radius: 8, x: 0, y: 8)
                            .shadow(color: .white.opacity(0.7), radius: 1, x: 0, y: 1)
                            .overlay {
                                Image(systemName: "arrow.right")
                                    .imageScale(.large)
                                    .foregroundColor(.white)
                            }
                        
                    }
                }
                .padding(.top, 30)
                .padding(.trailing)
                
                Spacer()
                
                NavigationLink(destination: RegisterView()) {
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                        Text("Sign in here")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color.sandy)
                }
                .padding(.bottom, .bottomInsets + 24)
            }
            .padding(.top, 40)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                ZStack {
                    Color.bg.opacity(0.6).ignoresSafeArea()
                    
                    Circles()
                }
            )
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
