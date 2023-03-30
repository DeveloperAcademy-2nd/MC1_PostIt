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
    @State var idx: Int = 0
    @State var selection: Int? = 0
    
    var body: some View {
        VStack{
            TabView(selection: $selection){
                ForEach(0..<4) { i in
                    testImages[i]
                        .resizable()
                        .scaledToFit()
                        .tag(i)
                        .onAppear() {
                            print("index \(i) 이미지")
                        }
                }
//                PlayerView(player: player1)
//                    .onAppear() {
//                        player1.play()
//                    }
//                    .onDisappear() {
//                        player1.pause()
//                    }
                VideoPlayer(player: player1)
                    .scaledToFit()
                    .onAppear() {
                        player1.play()
                        print("player1 is on appear and selection : 4")
                    }
                    .onDisappear() {
                        player1.pause()
                        player1.seek(to: .zero)
                    }
                    .tag(4)
                //                    .tag(4)
                ForEach(0..<2) { i in
                    testImages[i]
                        .resizable()
                        .scaledToFit()
                        .tag(5+i)
                        .onAppear() {
                            print("index \(5+i) 이미지")
                        }
                }
                //                VideoPlayer(player: player1)
                //                    .scaledToFit()
                //                    .onAppear(){
                //                        player1.play()
                //                        player2.pause()
                //                    }
                //                    .onDisappear(){
                //                        player1.pause()
                //                        player1.seek(to: .zero)
                //                    }
                //                    .tag(7)
                VideoPlayer(player: player2)
                    .scaledToFit()
                    .onAppear(){
//                        player2.seek(to: .zero)
                        player2.play()
                        print("player2 is on appear and selection : 7")
                    }
                    .onDisappear(){
                        player2.pause()
                        player2.seek(to: .zero)
                    }
                    .tag(7)
//                PlayerView(player: player2)
//                    .onAppear(){
//                        player2.play()
//                    }
//                    .onDisappear() {
//                        player2.pause()
//                    }
                ForEach(0..<3) { i in
                    testImages[i]
                        .resizable()
                        .scaledToFit()
                        .tag(8+i)
                        .onAppear() {
                            print("\(8+i)")
                        }
                }
                
            }
            .tabViewStyle(.page)
            .onChange(of: selection) { newSelection in
                switch newSelection {
                case 4:
                    player1.seek(to: .zero)
                    player1.play()
                    player2.pause()
                case 7:
                    player2.seek(to: .zero)
                    player2.play()
                    player1.pause()
                default:
                    player1.pause()
                    player2.pause()
                }
            }
            //            ProgressView((""), value: Double(idx), total:  11)
        }
    }
}

struct PlayerView: View {
    let player: AVPlayer
    
    var body: some View {
        VideoPlayer(player: player)
            .scaledToFit()
//            .frame(height: 200)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Test1View()
            .previewInterfaceOrientation(.landscapeLeft
            )
    }
}
