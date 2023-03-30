//
//  SwiftUIView.swift
//  
//
//  Created by HAN GIBAEK on 2023/03/30.
//

import SwiftUI
import AVKit

struct Test2View: View {
    public let testImages: [Image] =
    [Image("Judy"), Image("Isaac"), Image("Saya"), Image("NextButton")]
    var player1 = AVPlayer(url: Bundle.main.url(forResource: "cake", withExtension: "mp4")!)
    var player2 = AVPlayer(url: Bundle.main.url(forResource: "chair", withExtension: "mp4")!)
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            testImages[0]
                .resizable()
                .scaledToFit()
                .tag(0)
            testImages[1]
                .resizable()
                .scaledToFit()
                .tag(1)
            testImages[2]
                .resizable()
                .scaledToFit()
                .tag(2)
            testImages[3]
                .resizable()
                .scaledToFit()
                .tag(3)
            VideoPlayer(player: player1)
                .scaledToFit()
                .tag(4)
            VideoPlayer(player: player2)
                .scaledToFit()
                .tag(5)
            testImages[1]
                .resizable()
                .scaledToFit()
                .tag(6)
        }
        .tabViewStyle(.page)
        .onChange(of: selection) { newSelection in
            
            print("\(newSelection)")
            
            switch newSelection {
            case 4:
                player2.pause()
                player1.seek(to: .zero)
                player1.play()
                //                print("\(newSelection)")
            case 5:
                player1.pause()
                player2.seek(to: .zero)
                player2.play()
                
                //                print("\(newSelection)")
            default:
                player1.pause()
                player2.pause()
            }
        }
    }
}


struct Test2View_Previews: PreviewProvider {
    static var previews: some View {
        Test2View()
    }
}
