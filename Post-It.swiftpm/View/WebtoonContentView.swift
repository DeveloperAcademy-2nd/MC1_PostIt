//
//  WebtoonContentView.swift
//  Post-It
//
//  Created by 최효원 on 2023/03/29.
//

import SwiftUI
import AVKit

struct WebtoonContentView: View {
    var images: [Image]
    var videos: [AVPlayer]
    
    @State var index = 0
    
    var body: some View {
        let totalCount = images.count + videos.count
        VStack {
            TabView(selection: $index) {
                ForEach(0..<4) {i in
                    images[i]
                        .resizable()
                        .scaledToFit()
                        .tag(i)
                }
                VideoPlayer(player: videos[0])
                    .scaledToFit()
                    .tag(4)
                VideoPlayer(player: videos[1])
                    .scaledToFit()
                    .tag(5)
                VideoPlayer(player: videos[2])
                    .scaledToFit()
                    .tag(6)
                images[1]
                    .resizable()
                    .scaledToFit()
                    .tag(7)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()
            .onChange(of: index) { newIndex in

                switch newIndex {
                case 4:
                    pauseAllPlayers()
                    videos[0].seek(to: .zero)
                    videos[0].play()
                case 5:
                    pauseAllPlayers()
                    videos[1].seek(to: .zero)
                    videos[1].play()
                case 6:
                    pauseAllPlayers()
                    videos[2].seek(to: .zero)
                    videos[2].play()
                default:
                    pauseAllPlayers()
                }
            }
            ProgressView((""), value: Double(index+1), total: Double(8))
        }
    }
    
    init()  {
        let player0 = AVPlayer(url: Bundle.main.url(forResource: "cake", withExtension: "mp4")!)
        let player1 = AVPlayer(url: Bundle.main.url(forResource: "chair", withExtension: "mp4")!)
        let player2 = AVPlayer(url: Bundle.main.url(forResource: "cake2", withExtension: "mp4")!)
        
        self.images = []
        self.videos = [player0, player1, player2]
        
        for i in 0...3 {
            self.images.append(Image("#\(i)"))
        }
        
    }
    
    func pauseAllPlayers() {
        videos[0].pause()
        videos[1].pause()
        videos[2].pause()
    }
}

struct WebtoonContentView_Previews: PreviewProvider {
    static var previews: some View {
        WebtoonContentView()
    }
}

struct WebtoonContentView_Previews_Landscape: PreviewProvider {
    static var previews: some View {
        WebtoonContentView().previewInterfaceOrientation(.landscapeLeft)
    }
}
