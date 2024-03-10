//
//  StartGame.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 09/12/2023.
//

import SwiftUI

struct StartGame: View {
    private var text: String = "Anatomy And Physiology Exam"
    @StateObject var triviaManager = TriviaManager()
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.bgStart, Color.bgStart.opacity(0.4)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                Circles()
                
                RoundedRectangle(cornerRadius: 30,style: .continuous)
                    .fill(Color.leaf)
                    .frame(width: .screenWidth - 80, height: 138)
                    .overlay(
                        Text(text)
                            .font(.fontCabinSketch(.bold, fontSize: 36))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.white, lineWidth: 10)

                    )
                    .offset(x: 0, y: -(.screenWidth/2))

                NavigationLink {
                    QuestionsPackets()
                        .environmentObject(triviaManager)
                } label: {
                    TextButton(text: "Start", background: Color.bg, widthButton: .screenWidth/5)
                }
                .offset(x:0,y: .screenWidth/4)
                    
            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct StartGame_Previews: PreviewProvider {
    static var previews: some View {
        StartGame()
    }
}




