//
//  AnatomyApp.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 09/12/2023.
//

import SwiftUI
import FirebaseCore


class AppDelegate : NSObject , UIApplicationDelegate {
  func application ( _ application : UIApplication ,
                   didFinishLaunchingWithOptions launchOptions : [ UIApplication . LaunchOptionsKey : Any ]? = nil ) -> Bool {
    FirebaseApp . configure ()

    return true
  }
}
@main
struct AnatomyApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
