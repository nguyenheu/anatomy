//
//  TotalScore.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 15/12/2023.
//

import SwiftUI

struct TotalScore: View {
    @ObservedObject var anatomyManager = AnatomyManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.bg.opacity(0.6).edgesIgnoringSafeArea(.all)
                
                Circles()
                VStack(spacing: 20) {
                    HeaderView(buttonAction: .home)
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Text("Quiz Score")

                        Text("\(anatomyManager.score) / \(anatomyManager.length)")
                            .foregroundColor(Color.leaf)
                    }
                    .font(.fontRoboto(.bold, fontSize: 40))
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Text("Next")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .background(Color.leaf)
                            .cornerRadius(12)
                            .foregroundColor(Color.white)
                            .shadow(color: Color.gray, radius: 5, x: 0, y: 5)
                            .onTapGesture {
                                Task.init {
                                    await anatomyManager.fetchTriviaQuestions()
                                }
                            }
                        
                        NavigationLink {
                            Explaination()
                                .environmentObject(AnatomyManager())
                        } label: {
                            Text("Track Quiz Report")
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(12)
                                .foregroundColor(Color.leaf)
                                .shadow(color: Color.gray, radius: 5, x: 0, y: 5)
                        }
                    }
                    .font(.fontRoboto(.bold, fontSize: 18))
                    .padding()

                    Spacer()
                }
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
