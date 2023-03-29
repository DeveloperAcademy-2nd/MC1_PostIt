//
//  SwiftUIView.swift
//  
//
//  Created by HAN GIBAEK on 2023/03/29.
//

import SwiftUI
import AVKit

struct Test1View: View {
    let testImages: [Image] =
    [Image("Judy"), Image("Isaac"), Image("Saya"), Image("NextButton")]
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "cake", withExtension: "mp4")!)
    @State var isPlaying: Bool = false
    
    var body: some View {
        TabView {
            ForEach(0..<4) { i in
                testImages[i]
                    .resizable()
                    .scaledToFit()
            }
            VideoPlayer(player: player)
                .scaledToFit()
                .onAppear(){
                    player.seek(to: .zero)
                    player.play()
                }
            ForEach(0..<2) { i in
                testImages[i]
                    .resizable()
                    .scaledToFit()
            }
            VideoPlayer(player: player)
                .scaledToFit()
                .onAppear(){
                    player.seek(to: .zero)
                    player.play()
                }
            VideoPlayer(player: player)
                .scaledToFit()
                .onAppear(){
                    player.seek(to: .zero)
                    player.play()
                }
            ForEach(0..<3) { i in
                testImages[i]
                    .resizable()
                    .scaledToFit()
            }
        }
        .tabViewStyle(.page)
//        .ignoresSafeArea()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Test1View()
            .previewInterfaceOrientation(.landscapeLeft
            )
    }
}
