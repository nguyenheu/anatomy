//
//  Explaination.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 17/12/2023.
//

import SwiftUI

struct Explaination: View {
    @StateObject var triviaManager = TriviaManager()
    var body: some View {
        ZStack(alignment: .top) {
            Color.bg.opacity(0.6).edgesIgnoringSafeArea(.all)
            
            Circles()
            
            VStack(spacing: 40) {
                HeaderView(buttonAction: .back)
                    
                ScrollView(.vertical) {
                    if !triviaManager.triviaQuestions.isEmpty {
                        ForEach(triviaManager.triviaQuestions.indices, id: \.self) { index in
                            VStack(alignment: .leading) {
                                HStack(spacing: 8) {
                                    Text("Quiz \(index + 1):")
                                    
                                    Text(triviaManager.triviaQuestions[index].question)
                                        
                                }
                                .font(.fontRoboto(.bold, fontSize: 18))
                                .padding(.leading)
                                
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ac nisl eu lectus tincidunt congue nec ac nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin condimentum, lectus eget rhoncus faucibus, urna nunc sagittis tellus, quis eleifend augue arcu ac lorem.")
                                    .font(.fontRoboto(.light, fontSize: 20))
                                    .padding(.leading, 32)
                            }
                            .padding(.bottom)
                        }
                    } else {
                        Text("Loading...")
                    }
                    
                    
                }
                
                
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarHidden(true)
    }
}

struct Explaination_Previews: PreviewProvider {
    static var previews: some View {
        Explaination()
            .environmentObject(TriviaManager())
    }
}
