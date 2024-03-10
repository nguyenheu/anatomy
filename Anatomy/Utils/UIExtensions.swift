//
//  UIExtensions.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 13/12/2023.
//

import SwiftUI
enum CabinSketch: String {
    case bold       = "CabinSketch-Bold"
}
enum Roboto: String {
    case bold       = "Roboto-Bold"
    case regular    = "Roboto-Regular"
    case light      = "Roboto-Light"
}

extension Font {
    static func fontCabinSketch(_ font: CabinSketch, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
    static func fontRoboto(_ font: Roboto, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}

extension CGFloat {
    static var screenWidth: Double {
        return UIScreen.main.bounds.size.width
    }
    static var screenHeight: Double {
        return UIScreen.main.bounds.size.height
    }

}

extension Color {
    
    static let bg       = Color("bg")
    static let bgStart  = Color("bgStart")
    static let coral    = Color("coral")
    static let leaf     = Color("leaf")
    static let sandy    = Color("sandy")
    static let terra    = Color("terra")
}

extension Image {
    // image from assets
    static let back     = Image("back")
    static let house    = Image("house")
    static let share    = Image("share")
    static let tick     = Image("tick")
    static let xmark    = Image("xmark")
    
    //image from system
}
