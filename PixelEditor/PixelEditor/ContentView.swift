//
//  ContentView.swift
//  PixelEditor
//
//  Created by nutterfi on 4/6/21.
//

import SwiftUI

// TODO:
// 0. Decide ultimately WHO GETS TAP/DRAG REGISTER PRIORITY?
// IS IT THE INDIVIDUAL PIXELVIEW? ORRRRRRRRR THe ContentView
// Currenty we are doing this on the individual pixels
/*
 1. Data Persistence
 - Model object for an array of pixel color data
 
 2. Paint a group of pixels
 - This would require that each pixel knows about its neighbors. Anything that had the same color would be reassigned the new color OR limit to those touching the tapped pixel
 - OR All adjacent pixels that have not been assigned a color could be given that color as well
 
 3. Export our image to file or share it
 - This is going to require either a model object or transferring the color data to a UIImage in UIKit or Both maybe? idk
 - Sharing: built-in share sheet UIKit? SwiftUI version? idk
 4. tap previously colored image to erase - DONE
 5. Background transparent checkerboard
 - Create an ImageView with alternating colors
 - ZStack the SCrollview contents and make another ForEach...
 - PixelViewbackgroundcolor alternating
*/

struct ContentView: View {
  @State private var columns = 8
  
  @State private var selectedColor: Color = .black
  @State private var selectedIndex: Int = 0

  @State private var presets: [Color] = [.black, .red, .blue, .green]
  
  @State private var scale: CGFloat = 0.5
  
  init() {
    selectedColor = presets.first!
  }
  
  var body: some View {
    ZStack(alignment: .bottom) {
      Color.purple.ignoresSafeArea()
      
      VStack {
        Slider(value: $scale)
          .padding()
        
        Picker("", selection: $columns) {
          Text("8").tag(8)
          Text("16").tag(16)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        // combo of cIdx and rIdx will indicate background color of the PixelView
        ScrollView([.vertical, .horizontal], content: {
          VStack(spacing: 1) {
            ForEach(0..<columns, id: \.self) { cIdx in
              HStack(spacing: 1) {
                ForEach(0..<columns, id: \.self) { rIdx in
                  PixelView(newColor: $selectedColor)
                    .frame(width: scale * 64, height: scale * 64)
                    .border(Color.white)
                }
              }
            }
          }
        })
      }
      
      
      // ON TAP / ON DRAG
      // change the square color
      //          Spacer()
      HStack {
        ForEach(0 ..< presets.count, id: \.self) {index in
          Circle()
            .frame(height: 25)
            .shadow(color: index == selectedIndex ? Color.black : Color.clear, radius: 10)
            .foregroundColor(presets[index])
            .onTapGesture {
              selectedColor = presets[index]
              selectedIndex = index
            }
        }
        .onChange(of: selectedColor, perform: { value in
          presets[selectedIndex] = selectedColor
        })
        
        ColorPicker("", selection: $selectedColor)
      }
      .padding()
      .background(Color.purple.opacity(0.3))
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewDevice("iPhone 11 Pro Max")
  }
}
