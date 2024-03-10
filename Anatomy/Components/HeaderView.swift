//
//  Back+Share.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 10/12/2023.
//

import SwiftUI

enum ButtonAction {
    case back
    case home
}

struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var triviaManager: TriviaManager
    var buttonAction: ButtonAction
    var body: some View {
        HStack(alignment: .top) {
            CustomRectangle()
                .frame(width: .screenWidth/5, height: .screenHeight/6)
                .foregroundColor(Color.sandy)
                .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
                .overlay(
                    Circle()
                        .fill(Color.white).frame(width: 50, height: 50, alignment: .center)
                        .overlay(
                            Button {
                                performAction()
                            } label: {
                                getImage()
                            }
                        )
                        .offset(y: -16)
                )
            Spacer()
            
            CustomRectangle()
                .frame(width: .screenWidth/3, height: .screenHeight/4)
                .foregroundColor(Color.terra)
                .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
            
            Spacer()
            
            CustomRectangle()
                .frame(width: .screenWidth/5, height: .screenHeight/6)
                .foregroundColor(Color.sandy)
                .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
                .overlay(
                    Circle()
                        .fill(Color.white).frame(width: 50, height: 50, alignment: .center)
                        .overlay(
                            Button {
                                print("Hello")
                            } label: {
                                Image.share
                            }
                        )
                        .offset(y: -16)
                )
        }.padding(.horizontal)
    }
    
    private func performAction() {
            switch buttonAction {
            case .back:
                self.presentationMode.wrappedValue.dismiss()
//                Task.init {
//                    await triviaManager.fetchTriviaQuestions()
//                }
            case .home:
                self.presentationMode.wrappedValue.dismiss()
                print("Hello")
                Task.init {
                    await triviaManager.fetchTriviaQuestions()
                }
                
            }
        }

        private func getImage() -> Image {
            switch buttonAction {
            case .back:
                return Image.back
            case .home:
                return Image.house
            }
        }
}

struct Back_Share_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(buttonAction: .back)
            .environmentObject(TriviaManager())
    }
}


