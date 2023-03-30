//
//  WebtoonContentView.swift
//  Post-It
//
//  Created by 최효원 on 2023/03/29.
//

import SwiftUI
import AVKit

struct Content {
    //    var id: Int
    var image: Image?
    var video: AVPlayer?
    var someView: AnyView?
}

struct WebtoonContentView: View {
    @State var contents: [Content] = []
    @State var totalCount: Int = 0
    @State var index = 0
    
    var body: some View {
        
        VStack {
            TabView(selection: $index) {
                ForEach(0..<contents.count, id: \.self) { i in
                    if let image = contents[i].image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if let player = contents[i].video {
                        VideoPlayer(player: player)
                            .scaledToFit()
                    } else if let someView = contents[i].someView {
                        someView
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()
            .onAppear() {
                for i in 0...3 {
                    contents.append(Content(image: Image("#\(i)")))
                }
                contents.append(Content(video: AVPlayer(url: Bundle.main.url(forResource: "cake", withExtension: "mp4")!)))
                contents.append(Content(video: AVPlayer(url: Bundle.main.url(forResource: "chair", withExtension: "mp4")!)))
                contents.append(Content(someView: AnyView(Sample1View())))
                contents.append(Content(someView: AnyView(Sample2View())))
                
                totalCount = contents.count
            }
            .onChange(of: index) { newIndex in
                pauseAllPlayers()
                if let player = contents[newIndex].video {
                    player.seek(to: .zero)
                    player.play()
                }
            }
        }
        ProgressView((""), value: Double(index+1), total: Double(totalCount))
    }

    func pauseAllPlayers() {
        for content in contents{
            if let player = content.video {
                player.pause()
            }
        }
    }
}

struct Sample1View: View {
    var body: some View {
        Text("Sample1")
            .font(.largeTitle)
    }
}

struct Sample2View: View {
    var body: some View {
        Text("Sample2")
            .font(.largeTitle)
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
