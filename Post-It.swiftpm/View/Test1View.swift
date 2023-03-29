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
    @State var player1 = AVPlayer(url: Bundle.main.url(forResource: "cake", withExtension: "mp4")!)
    @State var player2 = AVPlayer(url: Bundle.main.url(forResource: "chair", withExtension: "mp4")!)
    @State var isPlaying: Bool = false
    
    var body: some View {
        TabView {
            ForEach(0..<4) { i in
                testImages[i]
                    .resizable()
                    .scaledToFit()
//                    .ignoresSafeArea(.all)
//                    .edgesIgnoringSafeArea(.all)
                
            }
            VideoPlayer(player: player1)
                .scaledToFit()
                .onAppear(){
                    player1.seek(to: .zero)
                    player1.play()
                }
//                .ignoresSafeArea(.all)
                .edgesIgnoringSafeArea(.bottom)
            ForEach(0..<2) { i in
                testImages[i]
                    .resizable()
                    .scaledToFit()
            }
            VideoPlayer(player: player1)
                .scaledToFit()
                .onAppear(){
                    player1.seek(to: .zero)
                    player1.play()
                }
            VideoPlayer(player: player2)
                .scaledToFit()
                .onAppear(){
                    player2.seek(to: .zero)
                    player2.play()
                }
                .onDisappear(){
                    player2.pause()
                }
            ForEach(0..<3) { i in
                testImages[i]
                    .resizable()
                    .scaledToFit()
            }
        }
        .tabViewStyle(.page)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Test1View()
            .previewInterfaceOrientation(.landscapeLeft
            )
    }
}
