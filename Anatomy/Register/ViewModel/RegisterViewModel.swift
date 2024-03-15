//
//  RegisterViewModel.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 15/03/2024.
//

import Foundation
class RegisterViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var username: String = ""
    
    @Published var showPassword: Bool = false
    
    func register() {
        Task {
            try await AuthService.shared.registerUser(with: email, password: password, username: username)
        }
    }
}
