//
//  Circles.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 10/12/2023.
//

import SwiftUI

struct Circles: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white.opacity(0.6))
                .frame(width: 200, height: 200)
                .offset(x:-.screenWidth/3, y: .screenWidth/5)
            
            Circle()
                .fill(Color.white.opacity(0.6))
                .frame(width: 142, height: 142)
                .offset(x:.screenWidth/2, y: .screenWidth/2)
            
            Circle()
                .fill(Color.white.opacity(0.6))
                .frame(width: 50, height: 50)
                .offset(x:-.screenWidth/7, y: -.screenWidth/3)
            
            Circle()
                .fill(Color.white.opacity(0.6))
                .frame(width: 70, height: 70)
                .offset(x:.screenWidth/6, y: -.screenWidth/6)
            
            Circle()
                .fill(Color.white.opacity(0.6))
                .frame(width: 100, height: 100)
                .offset(x:.screenWidth/5, y: .screenWidth/1.2)

        }
    }
}

struct Circles_Previews: PreviewProvider {
    static var previews: some View {
        Circles()
    }
}
