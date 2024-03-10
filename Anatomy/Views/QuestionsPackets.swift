//
//  QuestionsPackets.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 09/12/2023.
//

import SwiftUI

struct QuestionsPackets: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .top) {
            Color.bg.opacity(0.6).edgesIgnoringSafeArea(.all)
            
            Circles()
            
            VStack {
                HeaderView(buttonAction: .back)
                    .padding(.bottom, 60)
                    
//                Spacer()
                
                QuizPackets()

                Spacer()
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarHidden(true)
    }
}

struct QuestionsPackets_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsPackets()
    }
}
