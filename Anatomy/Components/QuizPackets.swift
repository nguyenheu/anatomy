//
//  QuizPackets.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 10/12/2023.
//

import SwiftUI

struct QuizPackets: View {
    let regularQuestionCounts = Array(stride(from: 10, through: 50, by: 10))
    
    @EnvironmentObject var anatomyManager: AnatomyManager
    var body: some View {
        NavigationLink {
            if !anatomyManager.reachEnd {
                Quiz()
                    .environmentObject(anatomyManager)
            } else {
                TotalScore(anatomyManager: anatomyManager)
            }
        } label: {
            VStack(alignment: .center, spacing: 20) {
                ForEach(regularQuestionCounts, id: \.self) { number in
                    CustomTextQuestionModifier(number: number)
                }

            }
        }
    }
}

struct CustomTextQuestionModifier: View {
    let number: Int
    
    var body: some View {
        Text("\(number) questions")
            .font(.fontRoboto(.bold, fontSize: 20))
            .frame(width: .screenWidth - 100)
            .padding(.vertical)
            .foregroundColor(.white)
            .background(Color.leaf)
            .cornerRadius(10)
            .shadow(color: Color.gray, radius: 5, x: 0, y: 5)
    }
}

struct QuizPackets_Previews: PreviewProvider {
    static var previews: some View {
        QuizPackets()
            .environmentObject(AnatomyManager())
    }
}
