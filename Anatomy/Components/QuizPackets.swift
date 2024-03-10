//
//  QuizPackets.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 10/12/2023.
//

import SwiftUI

struct QuizPackets: View {
    private let adaptiveColumns = [GridItem(.adaptive(minimum: .screenWidth / 2 - 10), spacing: 10)]
    @State private var showAllQuestions = false
        
    let regularQuestionCounts = Array(stride(from: 10, through: 100, by: 10)) // Normal question
    let additionalQuestions = [200] // Bonus question
    
    var allQuestionCounts: [Int] {
        if showAllQuestions {
            return regularQuestionCounts + additionalQuestions
        } else {
            return regularQuestionCounts
        }
    }
    @EnvironmentObject var triviaManager: TriviaManager
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                ForEach(10...100, id: \.self) { number in
                    if number % 10 == 0 {
                        Text("\(number) questions")
                            .font(.fontRoboto(.bold, fontSize: 20))
                            .frame(width: .screenWidth/2 - 16)
                            .padding(.vertical)
                            .foregroundColor(.white)
                            .background(Color.leaf)
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 5, x: 0, y: 5)
                    }
                }
            }
            .padding(.bottom)
            NavigationLink {
                if !triviaManager.reachEnd {
                    Quiz()
                        .environmentObject(triviaManager)
                } else {
                    TotalScore(triviaManager: triviaManager)
                }
                
            } label: {
                Text("\(200) questions")
                    .font(.fontRoboto(.bold, fontSize: 20))
                    .frame(width: .screenWidth - 100)
                    .padding(.vertical)
                    .foregroundColor(.white)
                    .background(Color.leaf)
                    .cornerRadius(10)
                    .shadow(color: Color.gray, radius: 5, x: 0, y: 5)
            }
        }
    }
}

struct QuizPackets_Previews: PreviewProvider {
    static var previews: some View {
        QuizPackets()
            .environmentObject(TriviaManager())
    }
}
