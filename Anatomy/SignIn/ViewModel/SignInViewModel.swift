//
//  SignInViewModel.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 15/03/2024.
//

import Foundation
class SignInViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    
    func signIn() {
        Task {
            try await AuthService.shared.signInUser(with: email, password: password)
        }
    }
}
