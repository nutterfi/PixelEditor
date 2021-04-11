//
//  PixelView.swift
//  PixelEditor
//
//  Created by nutterfi on 4/6/21.
//

import SwiftUI

struct PixelView: View {
  @Binding var newColor: Color
  var backgroundColor: Color = .clear
  @State private var color: Color = .almostClear
  
  func assign(color: Color) {
    self.newColor = color
  }
  
  var body: some View {
    color
      .background(backgroundColor)
      .onTapGesture {
        color = newColor == color ? .almostClear : newColor
      }
  }
}

struct PixelView_Previews: PreviewProvider {
  static var previews: some View {
    PixelView(newColor: .constant(Color.purple))
  }
}
