//
//  Color+Extensions.swift
//  PixelEditor
//
//  Created by nutterfi on 4/6/21.
//

import SwiftUI

extension Color {
  static var random: Color {
    let r = Double.random(in: 0..<1)
    let g = Double.random(in: 0..<1)
    let b = Double.random(in: 0..<1)
    return Color(.sRGB, red: r, green: g, blue: b, opacity: 1)
  }
  static var randomWithAlpha: Color {
    let r = Double.random(in: 0..<1)
    let g = Double.random(in: 0..<1)
    let b = Double.random(in: 0..<1)
    let a = Double.random(in: 0..<1)
    
    return Color(.sRGB, red: r, green: g, blue: b, opacity: a)
  }
  
  static var almostClear: Color {
    Color(red: 1, green: 1, blue: 1, opacity: 0.001)
  }
}
