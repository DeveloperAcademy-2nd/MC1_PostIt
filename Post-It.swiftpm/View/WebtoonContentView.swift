//
//  WebtoonContentView.swift
//  Post-It
//
//  Created by 최효원 on 2023/03/29.
//

import SwiftUI
import AVKit

struct WebtoonContentView: View {
  
  let images = (1...24).compactMap { Image("image\($0)") }
     @State var index = 0
     
     var body: some View {
         let count = images.count
         VStack {
             TabView(selection: $index) {
                 ForEach(0 ..< 24) { i in
                     images[i]
                         .resizable()
                         .scaledToFit()
                 }
             }
             .tabViewStyle(.page(indexDisplayMode: .never))
             .ignoresSafeArea()
             ProgressView((""), value: Double(index+1), total: Double(count))
         }
     }
 }

struct WebtoonContentView_Previews: PreviewProvider {
  static var previews: some View {
    WebtoonContentView().previewInterfaceOrientation(.landscapeLeft)
  }
}
