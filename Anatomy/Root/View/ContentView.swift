//
//  ContentView.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 15/03/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var contentViewModel = ContentViewModel()
//    @StateObject var anatomyManager = AnatomyManager()
    var body: some View {
        if contentViewModel.userSesstion != nil {
            StartGame()
        } else {
            SignInView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
