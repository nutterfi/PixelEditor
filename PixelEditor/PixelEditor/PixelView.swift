//
//  PixelView.swift
//  PixelEditor
//
//  Created by nutterfi on 4/6/21.
//

import SwiftUI

struct PixelView: View {
  @Binding var newColor: Color
  
  @State private var color: Color = .white
    
  func assign(color: Color) {
    self.newColor = color
  }
  
  var body: some View {
    color
      .onTapGesture {
        color = newColor
      }
  }
}

struct PixelView_Previews: PreviewProvider {
    static var previews: some View {
      PixelView(newColor: .constant(Color.purple))
    }
}
