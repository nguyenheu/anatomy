//
//  ContentView.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 09/12/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var anatomyManager = AnatomyManager()
    var body: some View {
        StartGame()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
