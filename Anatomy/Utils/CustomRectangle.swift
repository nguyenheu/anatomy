//
//  CustomRectangle.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 09/12/2023.
//

import SwiftUI

struct CustomRectangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.width
        let height = rect.height

        // Define the points of the triangle
        let bottomLeft = CGPoint(x: 0, y: height)
        let bottomMiddle = CGPoint(x: width / 2, y: height - width / 2)
        let bottomRight = CGPoint(x: width, y: height)

        // Create the path
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: bottomRight)
        path.addLine(to: bottomMiddle)
        path.addLine(to: bottomLeft)
        path.closeSubpath()

        return path
    }
}
