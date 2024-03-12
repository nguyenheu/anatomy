//
//  AnatomyApp.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 09/12/2023.
//

import SwiftUI

@main
struct AnatomyApp: App {
    @StateObject var anatomyManager = AnatomyManager()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                StartGame()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(anatomyManager)
        }
    }
}
