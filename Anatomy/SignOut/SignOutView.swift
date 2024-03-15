//
//  SignOutView.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 15/03/2024.
//

import SwiftUI

struct SignOutView: View {
    @State private var animate: Bool = false
    var body: some View {
        ZStack {
            Color.bg.opacity(0.6).ignoresSafeArea()
            
            Circles()
            
            VStack {
                Text("Sign Out")
                    .font(.fontRoboto(.bold, fontSize: 36))
                    .foregroundColor(.coral)
                    .offset(y: animate ? 0 : 400)
                    .scaleEffect(animate ? 1 : 0.4)
                    .opacity(animate ? 1 : 0.1)
                
                Button {
                    
                } label: {
                    Label {
                        Text("Sign out")
                            
                    } icon: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                    .font(.fontRoboto(.bold, fontSize: 24))
                    .foregroundColor(.white)
                    .frame(width: .screenWidth/2, height: 60, alignment: .center)
                    .background(Color.coral, in: RoundedRectangle(cornerRadius: 12))
                    .shadow(color: Color.coral, radius: 8, x: 0, y: 8)
                    .shadow(color: .white.opacity(0.7), radius: 1, x: 0, y: 1)
                    .offset(y: animate ? 0 : 400)
                    .scaleEffect(animate ? 1 : 0.4)
                    .opacity(animate ? 1 : 0.1)
                }
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1)) {
                animate = true
            }
        }
    }
}

struct SignOutView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutView()
    }
}
