//
//  CustomTextField.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 15/03/2024.
//

import SwiftUI

struct CustomTextField: View {
    var text: Binding<String>
    var title: String
    var width: CGFloat
    
    @Binding var showPassword: Bool
    var body: some View {
        VStack {
            if title == "Password" && !showPassword {
                SecureField(text: text) {
                    Text(title)
                        .foregroundStyle(.white.opacity(0.5))
                }
            } else {
                TextField(text: text) {
                    Text(title)
                        .foregroundStyle(.white.opacity(0.5))
                }
            }
        }
        .foregroundColor(.white)
        .padding(.leading)
        .frame(width: .screenWidth - 20, height: 54)
        .background(Color.coral, in: RoundedRectangle(cornerRadius: 10))
        .overlay(alignment: .trailing) {
            if title == "Password" {
                Button {
                    withAnimation(.easeOut) {
                        showPassword.toggle()
                    }
                } label: {
                    Image(systemName: showPassword ? "eye.fill" : "eye.slash")
                        .foregroundColor(.white)
                        .padding(.trailing)
                }
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), title: "Password", width: .screenWidth - 20, showPassword: .constant(false))
    }
}
