//
//  AuthService.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 15/03/2024.
//

import Foundation
import Firebase
class AuthService {
    static let shared = AuthService()
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    //register user
    func registerUser(with email: String, password: String, username: String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Could not register the user: \(error.localizedDescription)")
        }
    }
    
    //signin
    func signInUser(with email: String, password: String) async throws {
        
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Could not sign in the user: \(error.localizedDescription)")
        }
    }
    
    //sigout
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
        } catch {
            print("DEBUG: Could not sign in the user: \(error.localizedDescription)")
        }
        
    }
}
