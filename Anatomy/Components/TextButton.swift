//
//  PrimaryButton.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 09/12/2023.
//

import SwiftUI

struct TextButton: View {
    var text: String
    var background: Color
    var widthButton: CGFloat?
    var body: some View {
        Text(text)
            .font(.fontRoboto(.bold, fontSize: 36))
            .foregroundColor(Color.white)
            .padding()
            .padding(.horizontal, widthButton)
            .background(background)
            .cornerRadius(20)
            .shadow(radius: 10)
    }
}

struct TextButton_Previews: PreviewProvider {
    static var previews: some View {
        TextButton(text: "Start", background: Color.bg)
    }
}
