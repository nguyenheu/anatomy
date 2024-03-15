//
//  ContentViewModel.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 15/03/2024.
//

import Foundation
import FirebaseAuth
import Combine

class ContentViewModel : ObservableObject {
    @Published var userSesstion: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    init() {
        setUpSubscribers()
    }
    
    private func setUpSubscribers() {
        //receive the value commited
        
        AuthService.shared.$userSession
            .sink { [weak self] userSesstion in
                DispatchQueue.main.async {
                    self?.userSesstion = userSesstion
                }
            }.store(in: &cancellables)
    }
}
