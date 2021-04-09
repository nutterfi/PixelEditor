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

// 1. Data Persistence
// 2. Paint a group of pixels
// 3. Export our image to file or share it
// 4. tap previously colored image to erase
// 5. ??


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
        
        ScrollView([.vertical, .horizontal], content: {
          VStack(spacing: 1) {
            ForEach(0..<columns, id: \.self) { _ in
              HStack(spacing: 1) {
                ForEach(0..<columns, id: \.self) { _ in
                  PixelView(newColor: $selectedColor)
                    .frame(width: scale * 64, height: scale * 64)
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
