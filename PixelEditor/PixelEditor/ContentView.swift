//
//  ContentView.swift
//  PixelEditor
//
//  Created by nutterfi on 4/6/21.
//

import SwiftUI

// TODO:
// 1. Decide ultimately WHO GETS TAP/DRAG REGISTER PRIORITY?
// IS IT THE INDIVIDUAL PIXELVIEW? ORRRRRRRRR THe ContentView
// Currenty we are doing this on the individual pixels
// 2. Pinch to zoom
// 3. Color picker to allow the user to pick their own colors
// 4. Array of previously chosen colors to quickly choose from
// 5. Export our image
// 6. ???
// 7. profit


struct ContentView: View {
  @State private var columns = 8
  @State private var rows = 8
  
  @State private var color: Color = .white
  
  var items: [GridItem] {
    [GridItem(GridItem.Size.flexible(minimum: 8, maximum: .infinity), spacing: 5, alignment: .center)
    ]
  }
  
  var body: some View {
    ZStack(alignment: .bottom) {
      Color.purple.ignoresSafeArea()
      
      ScrollView(content: {
        VStack {
          ForEach(0..<columns) { _ in
            HStack {
              ForEach(0..<rows) { _ in
                PixelView(newColor: $color)
                  .frame(width: 64, height: 64)
              }
            }
          }
        }
      })
      
      
      // ON TAP / ON DRAG
      // change the square color
      //          Spacer()
      Circle()
        .foregroundColor(color)
        .frame(width:100, height: 100)
        .onTapGesture {
          color = Color.random
        }
      
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
