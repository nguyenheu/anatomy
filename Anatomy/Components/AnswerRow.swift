//
//  AnswerRow.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 10/12/2023.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var anatomyManager: AnatomyManager
    
    var answer: Answer

    @State private var isSelected = false
    var body: some View {
        HStack {
            
            if isSelected {
                Image(answer.isCorrect ? "tick" : "xmark")
                    .frame(width: 24, height: 24)
                    .padding(.trailing)
                Text(answer.text)
                    .font(.fontRoboto(.bold, fontSize: 18))
                    .foregroundColor(answer.isCorrect ? Color.leaf : Color.terra)
                
            } else {
                Text(answer.text)
                    .font(.fontRoboto(.bold, fontSize: 18))
                    .foregroundColor(Color.white)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(isSelected ? Color.white.opacity(0.9) : Color.leaf)
        .cornerRadius(10)
        .shadow(color: answer.isCorrect ? Color.gray : Color.clear, radius: 5, x: 0, y: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? (answer.isCorrect ? Color.clear : Color.terra.opacity(0.5)) : Color.gray, lineWidth: 1)
        )
        .onTapGesture {
            if !anatomyManager.answerSelected {
                withAnimation(.easeInOut) {
                    isSelected = true
                    anatomyManager.selectAnswer(answer: answer)
                }
            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Singles", isCorrect: false))
            .environmentObject(AnatomyManager())
    }
}
