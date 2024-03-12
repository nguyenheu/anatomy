//
//  Quiz.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 10/12/2023.
//

import SwiftUI

struct Quiz: View {
    @EnvironmentObject var anatomyManager: AnatomyManager
    @State private var currentQuestion: String = ""
    var body: some View {
        ZStack(alignment: .top) {
            Color.bg.opacity(0.6).edgesIgnoringSafeArea(.all)
            
            Circles()
            
            VStack(spacing: 32) {
                HeaderView(buttonAction: .home)
                            .environmentObject(anatomyManager)
                if !anatomyManager.triviaQuestions.isEmpty {
                    Text(anatomyManager.question)
                        .font(.fontRoboto(.bold, fontSize: 18))
                        .padding(20)
                        .foregroundColor(Color.terra)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.white)

                    
                    VStack(spacing: 12) {
                        ForEach(anatomyManager.answerChoices, id: \.id) { answer in
                            AnswerRow(answer: answer)
                                .environmentObject(anatomyManager)
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    Button {
                        anatomyManager.goToNextQuestion()
                    } label: {
                        Text("Next")
                            .font(.fontRoboto(.bold, fontSize: 18))
                            .foregroundColor(Color.white)
                            .padding()
                            .padding(.horizontal, 32)
                            .background(anatomyManager.answerSelected ? Color.terra : Color.coral)
                            .cornerRadius(10)
                    }
                    .disabled(!anatomyManager.answerSelected)

                    Spacer()
                } else {
                    ProgressView()
                }
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarHidden(true)
    }
}

struct Quiz_Previews: PreviewProvider {
    static var previews: some View {
        Quiz().environmentObject(AnatomyManager())
    }
}
