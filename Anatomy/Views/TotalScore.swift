//
//  TotalScore.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 15/12/2023.
//

import SwiftUI

struct TotalScore: View {
    @ObservedObject var anatomyManager = AnatomyManager()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color.bg.opacity(0.6).edgesIgnoringSafeArea(.all)
            
            Circles()
            VStack(spacing: 20) {
                HeaderView(buttonAction: .home)
                            .environmentObject(anatomyManager)
                
                Spacer()
                
                VStack(spacing: 20) {
                    Text("Quiz Score")

                    Text("\(anatomyManager.score) / \(anatomyManager.length)")
                        .foregroundColor(Color.leaf)
                }
                .font(.fontRoboto(.bold, fontSize: 40))
                
                Spacer()
                
                Text("Next")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.fontRoboto(.bold, fontSize: 18))
                    .padding()
                    .background(Color.leaf)
                    .cornerRadius(12)
                    .foregroundColor(Color.white)
                    .shadow(color: Color.gray, radius: 5, x: 0, y: 5)
                    .padding()
                    .onTapGesture {
                        Task.init {
                            await anatomyManager.fetchTriviaQuestions(length: 10)
                        }
                        self.presentationMode.wrappedValue.dismiss()
                    }

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarHidden(true)
        }
    }
}

struct TotalScore_Previews: PreviewProvider {
    static var previews: some View {
        TotalScore(anatomyManager: AnatomyManager())
    }
}
